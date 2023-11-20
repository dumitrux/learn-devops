# :simple-kubernetes: Kubernetes

## Usefult resources

- [KodeKloud](https://kodekloud.com)

## Example

Based on the example

- [freeCodeCamp - Kubernetes Course - Full Beginners Tutorial](https://www.youtube.com/watch?v=d6WC5n9G_sM)
- [GitHub repository for the "Kubernetes for Beginners"](https://github.com/bstashchuk/k8s)

## 1 - Creating Kubernetes cluster using Minikube

### Create cluster

```bash
minikube status
minikube start --driver=hyperv
minikube status
```

### Connect to cluster

Connect to local server with the standard protocol SSH.

```bash
minikube ip
ssh docker@<k8s-cluster-IP>
> tcuser

docker ps
```

Minikube also provides command to SSH into local minikube node.
If you set the driver to docker you should use this one because normal SSH will not work.

```bash
minikube ssh
```

### Exploring with Kubectl

Can only be exxecuted inside the cluster with:

```bash
minikube kubectl
```

But it is recommended to use the default kubctl outside the cluster.
The connection is automatically created once Minikube is started.

```bash
kubectl cluster-info
kubectl get nodes
kubectl get pods
kubectl get namespaces

kubectl get pods --namespace=kube-system
```

## 2 - Creating just single Pod

Name of the Pod can be whatever and the image is from the Docker Hub.

```bash
kubectl run nginx --image=nginx
kubectl get pod
kubectl describe pod nginx
```

### Exploring Pod

Inside the cluster:

```bash
docker ps | grep nginx
docker exec -it <container-id> sh
> hostname
> hostname -i
> curl <container-ip>
```

Outside the cluster:

```bash
kubectl get pods -o wide
curl 172.17.0.3
```

Several container in the same Pod share the same IP.
IP address is internal from the Pod and it is not possible to connect from outside.

```bash
kubectl delete pod nginx
kubectl get pods
```

## 3 - Creating and exploring Deployment

Deployments are responsible of the creation of the Pods.
All pods inside the deployment will be exactly the same.

```bash
kubectl create deployment nginx-deployment --image=nginx
kubectl get deployments
kubectl get pods
kubectl describe deployment nginx-deployment
```

### Scale deployment

```bash
kubectl scale deployment nginx-deployment --replicas=5
kubectl get pods
kubectl get pods -o wide
```

```bash
kubectl scale deployment nginx-deployment --replicas=3
kubectl get pods -o wide
```

## 4 - Service

### Creating and exploring ClusterIP Service

IP address assigned to deployment and it only can be used inside the cluster.

```bash
kubectl get deploy
kubectl expose deployment nginx-deployment --port=8080 --target-port=80
kubectl get services
kubectl get svc
kubectl describe service nginx-deployment
```

### Deleting Deployment and Service

```bash
kubectl delete deployment nginx-deployment
kubectl delete service nginx-deployment
```

## 5 - Node application example

### Creating Node web application

Set up node app

```bash
New-Item -Path . -Name "k8s-web-hello" -ItemType "directory"
npm init -y
npm install express
Remove-Item -Recurse -Force node_modules
New-Item -Path . -Name "index.mjs" -ItemType "file"
Get-ChildItem
```

### Dockerizing Node application and pushing custom image to the Docker Hub

```bash
New-Item -Path . -Name "Dockerfile" -ItemType "file"
docker build . -t mitu7/k8s-web-hello
docker images | Select-String -Pattern k8s-web
docker login
> mitu7
docker push mitu7/k8s-web-hello
```

### Creating deployment based on the custom Docker image

```bash
kubectl get deploy
kubectl get svc
kubectl create deployment k8s-web-hello --image=mitu7/k8s-web-hello
kubectl get pods
kubectl expose deployment k8s-web-hello --port=3000
```

### Scaling custom image deployment

```bash
kubectl scale deployment k8s-web-hello --replicas=4
kubectl get pods
kubectl get pods -o wide

# Inside the cluster
curl <service-ClusterIP>; echo
```

### Creating NodePort Service

This service IP is avaiable externally

```bash
kubectl delete svc k8s-web-hello
kubectl get svc
kubectl expose deployment k8s-web-hello --type=NodePort --port=3000
kubectl get svc
curl <Minikube-IP>:<Target port>
minikube service k8s-web-hello
minikube service k8s-web-hello --url
```

### Creating LoadBalancer Service

When creating the LoadBalancer service type in a Cloud environment, the External-IP will be assigned automatically here it is in state `<pending>`.

```bash
kubectl delete svc k8s-web-hello
kubectl expose deployment k8s-web-hello --type=LoadBalancer --port=3000
minikube service k8s-web-hello
```

### Rolling update of the deployment

The StrategyType is RollingUpdate, helps tou roll out new version of
application to the production environment without any interruption.
This strategy means that new Pods will be created with new image,
while previous Pods are still running, so Pods will be replace one by one.

Generate new image

```bash
kubectl describe deployment k8s-web-hello
docker build . -t mitu7/k8s-web-hello:2.0.1
docker push mitu7/k8s-web-hello:2.0.1
```

Set new image for the deployment
If you quickly execute the second command here, you will see how the Pods
are being updated

```bash
kubectl set image deployment k8s-web-hello k8s-web-hello=mitu7/k8s-web-hello:2.0.1
kubectl rollout status deploy k8s-web-hello
```

### What happens when one of the pods is deleted

If you delete a Pod a new one will be created automatically, because we told Kubernetes that the desire number of Pods

```bash
kubectl delete pod <Pod-name>
kubectl get pods
```

### Kubernetes Dashboard

This is easy in Minikube, but in the Cloud it is needed to secure the net access

```bash
minikube dashboard
```

## 6 - Node application example with YAML

### Creating YAML deployment specification file

Instead of using imperative approach we will use declarative approach,
which is more used.

Clean up. Note that when deleting all the Kubernetes service is recreated again.

```bash
kubectl delete all --all
kubectl get pods
kubectl get svc 
kubectl get deployments
```

It is need to create a YAML file for deployment and another for service.
If you have Kubernetes VSC extension and type "Deployment" the configuration basic file will be automatically created.

```bash
New-Item -Path . -Name "deployment.yaml" -ItemType "file"
```

[deployment.yaml](https://github.com/bstashchuk/k8s/blob/main/deployment.yaml)

### How to use Kubernetes documentation

[Kubernetes API](https://kubernetes.io/docs/reference/kubernetes-api/)

### Applying YAML deployment file

```bash
kubectl apply -f deployment.yaml
kubectl get deploy
```

Add "replicas" entry in deployment.yaml file

```bash
kubectl apply -f deployment.yaml
```

### Creating YAML service specification file

As in the deployment.yaml file, if you have hte extension just type "Service"
and the basic configuration will be created.

```bash
New-Item -Path . -Name "service.yaml" -ItemType "file"
kubectl apply -f service.yaml
kubectl get svc
minikube service k8s-web-hello
```

[service.yaml](https://github.com/bstashchuk/k8s/blob/main/service.yaml)

### Delete all created by the YAML files

```bash
kubectl delete -f deployment.yaml -f service.yaml
kubectl get deploy
kubectl get svc
```

## 7 - Ngninx application with two endpoints

### Creating another web app with two endpoints

Make a copy of the "k8s-web-hello" folder and call it "k8s-web-to-nginx"

### Building custom Docker image for the second web app

```bash
npm install node-fetch
Remove-Item -Recurse -Force node_modules
docker build . -t mitu7/k8s-web-to-nginx
docker push mitu7/k8s-web-to-nginx
```

### Creating YAML specification for the second web app

Create the file "k8s-web-to-nginx.yaml" and copy&paste the content of
"service.yaml", then add "---" at the end of the file and copy at the end
the content of the "deployment.yaml".

### Creating YAML specification for the NGINX app

Create a copy of the file "k8s-web-to-nginx.yaml" and rename it to "nginx.yaml"
and edit it to create the nginx deployment and service

### Applying specifications for both apps

```bash
kubectl apply -f "k8s-web-to-nginx.yaml" -f "nginx.yaml"
kubectl get deploy
kubectl get svc
kubectl get pods
```

### Verifying connectivity between different deployments

```bash
minikube service k8s-web-to-nginx
```

On the new page add "/nginx" at the end

### Resolving Service name to IP address

```bash
kubectl get pods
kubectl exec <Pod-name> -- nslookup nginx
kubectl get svc
```

With this command we tried to resolve "nginx" name from
inside the container which belongs to that Pod.
The IP obtained it came from the nginx service

You can also try to retrieve the web page to verify that the connection
is established.

```bash
kubectl exec <Pod-name> -- wget -qO- http://nginx
```

### Deleting both applications

```bash
kubectl delete -f "k8s-web-to-nginx.yaml" -f "nginx.yaml"
```

## 8 - Changing Container Runtime from Docker to CRI-O

Delete current cluster

```bash
minikube status
minikube stop
minikube delete
```

You can use CRI-O or containerd as a container runtime in the K8S cluster.
To see if it worked you can connect to the cluster en execute the docker
command to see how it fails and then the specific command for the container runtime.

```bash
minikube start --drive=hyperv --container-runtime=cri-o
#minikube start --drive=hyperv --container-runtime=containerd
minikube status

minikube ip
ssh docker@<cluster-IP>
> tcuser
docker ps
sudo crictl ps
sudo crictl ps | grep k8s-web-to-nginx
```

### Deploying apps using CRI-O container runtime

```bash
kubectl apply -f "k8s-web-to-nginx.yaml" -f "nginx.yaml"
```

### Verifying connectivity between deployments

```bash
minikube service k8s-web-to-nginx
```

Once the window is open add "/nginx" at the end of the URL.
