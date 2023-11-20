# :simple-docker: Docker

[Docs Docker / Overview of the get started guide](https://docs.docker.com/get-started/)

## 1 - Run Docker tutorial image

### Clone

```bash
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .
```

### Build

```bash
cd getting-started
docker build -t docker101tutorial .
```

### Run

```bash
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
```

## 2 - Getting started app

### Getting App / Obtain Image

Download the ZIP file with the app.

### Build from Dockerfile

```bash
docker build -t getting-started .
```

### Run Container

```bash
docker run -dp 3000:3000 getting-started
```

- -d - run the container in detached mode (in the background)
- -p 80:80 - map port 80 of the host to port 80 in the container
- docker/getting-started - the image to use

```bash
docker ps -a
docker stop <the-container-id>
docker rm <the-container-id>

# Stop and remove
docker rm -f <the-container-id>
```

## 3 - Persistence with Named Volumes

Named Volumes when you do not have to worry about where the data is stored.

### Persistance example

```bash
docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
docker exec <container-id> cat /data.txt
docker run -it ubuntu ls /
```

### Persistance in getting-started app

```bash
docker volume create todo-db
docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
```

## 4 - Persistence with Bind Mounts

With bind mounts, we control the exact mountpoint on the host. Often used to provide additional data into containers.

```bash
docker run -dp 3000:3000 `
    -w /app -v "$(pwd):/app" `
    node:12-alpine `
    sh -c "yarn install && yarn run dev"
```

- -dp 3000:3000 - same as before. Run in detached (background) mode and create a port mapping
- -w /app - sets the container's present working directory where the command will run from
- -v "$(pwd):/app" - bind mount (link) the host's present getting-started/app directory to the container's /app directory (Docker requires absolute paths).
- node:12-alpine - the image to use. Note that this is the base image for our app from the Dockerfile
- sh -c "yarn install && yarn run dev" - the command. We're starting a shell using sh (alpine doesn't have bash) and running yarn install to install all dependencies and then running yarn run dev.

Check logs with:

```bash
docker logs -f <container-id>
```

## 5 - Multi-Container Apps

### Starting MySQL

```bash
docker network create todo-app
```

```bash
docker run -d `
    --network todo-app --network-alias mysql `
    -v todo-mysql-data:/var/lib/mysql `
    -e MYSQL_ROOT_PASSWORD=secret `
    -e MYSQL_DATABASE=todos `
    mysql:5.7
```

Docker recognizes we want to use a named volume and creates one automatically for us, so it create the volume named todo-mysql-data and mounting it at /var/lib/mysql, which is where MySQL stores its data.

```bash
docker exec -it <mysql-container-id> mysql -p
> secret
mysql> SHOW DATABASES;
```

### Connecting to MySQL

We're going to make use of the nicolaka/netshoot container, which ships with a lot of tools that are useful for troubleshooting or debugging networking issues.

```bash
docker run -it --network todo-app nicolaka/netshoot
> dig mysql
```

172.18.0.2

### Running our App with MySQL

The todo app supports the setting of a few environment variables to specify MySQL connection settings. They are:

- MYSQL_HOST - the hostname for the running MySQL server
- MYSQL_USER - the username to use for the connection
- MYSQL_PASSWORD - the password to use for the connection
- MYSQL_DB - the database to use once connected

Only use environment variables in development not in production, for security reasons use files instead "*_FILE".

```bash
docker run -dp 3000:3000 `
  -w /app -v "$(pwd):/app" `
  --network todo-app `
  -e MYSQL_HOST=mysql `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=secret `
  -e MYSQL_DB=todos `
  node:12-alpine `
  sh -c "yarn install && yarn run dev"
```

Connect to the mysql database and prove that the items are being written to the database.

```bash
docker exec -it ddc4af07d4a6 mysql -p todos
> secret
mysql> select * from todo_items;
```

## 6 - Using Docker Compose

At the root of the app project, create a file named "docker-compose.yml".

### Defining the App Service

From:

```bash
docker run -dp 3000:3000 `
  -w /app -v "$(pwd):/app" `
  --network todo-app `
  -e MYSQL_HOST=mysql `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=secret `
  -e MYSQL_DB=todos `
  node:12-alpine `
  sh -c "yarn install && yarn run dev"
```

To:

```yaml
version: "3.8"

services:
  app:
    image: node:12-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
```

Compose has short syntax and long syntax. For example, in ports and volumes.
Here we can also specify relative paths instead of abosolute.

### Defining the MySQL Service

From:

```bash
docker run -d `
  --network todo-app --network-alias mysql `
  -v todo-mysql-data:/var/lib/mysql `
  -e MYSQL_ROOT_PASSWORD=secret `
  -e MYSQL_DATABASE=todos `
  mysql:5.7
```

To:

```yaml
version: "3.8"

services:
  app:
    # The app service definition
  mysql:
    image: mysql:5.7
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment: 
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos

volumes:
  todo-mysql-data:
```

It is needed to define the volume mapping. When we ran the container with docker run, the named volume was created automatically, but not with Compose.

### Result of "docker-compose.yml"

```yaml
version: "3.8"

services:
  app:
    image: node:12-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos

  mysql:
    image: mysql:5.7
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment: 
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos

volumes:
  todo-mysql-data:
```

### Running our Application Stack

```bash
docker-compose up -d
docker-compose logs -f
docker-compose logs -f app
```

Docker Compose automatically creates a network specifically for the application stack.

When the app is starting up, it actually sits and waits for MySQL to be up and ready before trying to connect to it. Docker doesn't have any built-in support to wait for another container to be fully up, running, and ready before starting another container.

### Tearing it All Down

```bash
docker-compose down
```

By default, named volumes in your compose file are NOT removed when running docker-compose down. If you want to remove the volumes, you will need to add the --volumes flag.

## 7- Image Building Best Practices

### Security Scanning

When you have built an image, it is good practice to scan it for security vulnerabilities.

```bash
docker scan getting-started
```

### Image Layering

You can see the command that was used to create each layer within an image

```bash
docker image history getting-started
docker image history --no-trunc getting-started
```

### Layer Caching

Avoid yarn dependencies had to be reinstalled to decrease build times for your container images.

1. Update the Dockerfile to copy in the package.json first, install dependencies, and then copy everything else in.

```dockerfile
FROM node:12-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY . .
CMD ["node", "src/index.js"]
```

2. Create a file named .dockerignore in the same folder as the Dockerfile with the following contents.

```bash
node_modules
```

3. Build a new image using docker build.

```bash
docker build -t getting-started .
```

### Multi-Stage Builds

When building React applications, we need a Node environment to compile the JS code, SASS, and more into static HTML, JS, and CSS. If we aren't doing server-side rendering, we don't even need a Node environment for our production build. Why not ship the static resources in a static nginx container?

```dockerfile
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```

Here, we are using a node:12 image to perform the build (maximizing layer caching) and then copying the output into an nginx container.
