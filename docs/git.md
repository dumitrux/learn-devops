# Git
Useful links:
- https://learngitbranching.js.org/
- https://www.atlassian.com/git/tutorials
- https://adamcod.es/2014/12/10/git-pull-correct-workflow.html
- http://gitimmersion.com/lab_01.html


- `git stash`: To undo the local changes you have. Discard all local changes, but save them for possible re-use later:

## Configurar herramientas
Configura la información del usuario para todos los respositorios locales.
- `git config --global user.name  “[name]”`: Establece el nombre que desea esté anexado a sus transacciones de commit.
- `git config --global user.name`: para ver nombre especificado
- `git config --global user.email “[email]”`: Establece el e-mail que desea esté anexado a sus transacciones de commit, que será publico.
- `git config --global user.email`: para ver el email especificado
- `git config --global color.ui true`: Habilita la útil colorización del producto de la línea de comando.
- `git config --global --list`: ver las configuraciones hechas
- `git help`: muestra como funciona git, o si se especifica, un comando

## Crear repositorios
Inicia un nuevo repositorio u obtiene uno de una URL existente
- `git init`: marca inicio proyecto, git empieza a monitorear.
- `git init [project-name]`: Crea un nuevo repositorio local con el nombre especificado.
- `git clone [url]`: Descarga un proyecto y toda su historia de versión

## Estructura cambios
Revisa las ediciones y elabora una transacción de commit
- `git status`: Enumera todos los archivos nuevos o modificados que se deben confirmar.
- `git diff`: Muestra las diferencias de archivos que no se han enviado aún al
- área de espera
- `git add [file]`: Toma una instantánea del archivo para preparar la versión
- `git add -A`:  agrega todos los archivos.
- `git diff --staged`: Muestra las diferencias del archivo entre el área de espera y la última versión del archivo
- `git reset [file]`: Mueve el archivo del área de espera, pero preserva su contenido
- `git commit -m "[descriptive message]"`: Registra las instantáneas del archivo permanentemente en el historial de versión
- `git commit`: abre editor predeterminado para escribir el commit

## Cambios grupales
Nombra una serie de commits y combina esfuerzos ya culminados
- `git branch`: Enumera todas las ramas en el repositorio actual
- `git branch [branch-name]`: Crea una nueva rama
- `git checkout [branch-name]`: Cambia a la rama especificada y actualiza el directorio activo
- `git merge [branch]`: Combina el historial de la rama especificada con la rama actual
- `git branch -d [branch-name]`: Borra la rama especificada
- `git push -u origin [branch-name]`: Push your branch to the remote repository

## Nombres del archivo de refactorización
Reubica y retira los archivos con versión

- `git rm --cached [file]`: Retira el archivo del control de versiones, pero preserva el archivo a nivel local
- `git rm [file]`: Borra el archivo del directorio activo y pone en el área de espera el archivo borrado
- `git mv [file-original] [file-renamed]`: Cambia el nombre del archivo y lo prepara para commit

## Suprimir tracking
Excluye los archivos temporales y las rutas

*.log 
build/
temp-* 
Un archivo de texto llamado .gitignore suprime la creación accidental de versiones de archivos y rutas que concuerdan con los patrones especificados

- `git ls-files --other --ignored --exclude-standard`: Enumera todos los archivos ignorados en este proyecto

## Guardar fragmentos
Almacena y restaura cambios incompletos
- `git stash`: Almacena temporalmente todos los archivos tracked modificados
- `git stash list`: Enumera todos los sets de cambios en guardado rápido
- `git stash pop`: Restaura los archivos guardados más recientemente
- `git stash drop`: Elimina el set de cambios en guardado rápido más reciente

## Repasar historial
Navega e inspecciona la evolución de los archivos de proyecto
- `git log`: Enumera el historial de la versión para la rama actual
- `git log --follow [file]`: Enumera el historial de versión para el archivo, incluidos los cambios de nombre
- `git diff [first-branch]...[second-branch]`: Muestra las diferencias de contenido entre dos ramas
- `git show [commit]`: Produce metadatos y cambios de contenido del commit especificado

## Rehacer commits
Borra errores y elabora historial de reemplazo
- `git reset [commit]`: Deshace todos los commits después de [commit], preservando los cambios localmente
- `git reset --hard [commit]`: Desecha todo el historial y regresa al commit especificado

## Sincronizar cambios
Registrar un marcador de repositorio e intercambiar historial de versión
- `git fetch [bookmark]`: Descarga todo el historial del marcador del repositorio
- `git merge [bookmark]/[branch]`: Combina la rama del marcador con la rama local actual
- `git push [alias] [branch]`: Carga todos los commits de la rama local al GitHub
- `git pull`: Descarga el historial del marcador e incorpora cambios

## Primer proyecto
- `git log`: da una lista de todos los commits con su respectiva información
    - `git log > commits.txt`: crea fichero con el contenido de hacer git log
- `git checkout ‘codigo dado en git log’`: se puede viajar entre commits y ramas, si en lugar del codigo ponemos ‘master’ se mueve al últino commit
- `git reset`: similar a checkout, pero este elimina los commits
    - `git reset --soft ‘codigo dado en git log’`: borra commit, no toca workingarea(no toca el codigo)
    - `git reset --mixed`: borra stagingarea y no toca working area
    - `git reset --hard`: borra absolutamente todo lo que hay en el commit
      

## Ramas y fusiones
- Head: commit donde nos encontramos en ese momento
- Ramas: linea del tiempo en el proyecto. Cuando creamos nueva rama hereda lo que teníamos en la anterior (Master) y a partir de ese momento los cambios (commits) solo se guarda en esta rama
    - Rama Master:  cuando hacemos git init se crea por defecto, rama donde generamos commits
- `git branch`: muestra ramas
- `git branch ‘Nombre rama’`: crea nueva rama a partir de head
- `git checkout ‘Nombre rama’`: a parte de servir para moverse entre commits, también permite moverse entre ramas
- `git checkout -b ‘Nombre rama’`: crea rama y se mueve a ella
- `git branch -D ‘Nombre rama’`: borra una rama
- `git merge ‘Nombre rama’`: la rama que seleccionamos la absorbe la rama en que nos encontramos
- `git branch -a`: muestra todas las ramas incluidas las ramas ocultas

## Gestor de repositorios (GitHub, GitLab, etc)
- `git remote`: vincula proyecto local con proyecto remoto
- `git remote add origin ‘https’`:
- `git remote -v`: comrpobamos enlace
- `git remote remove origin`: quita vinculación
- `git push`: manda cambios (commits) de pc a github
- `git push origin master`: subimos rama master
- `git push origin ‘Nombre rama’`: subimos rama y se crea nueva rama en github

## Github
- Issues: consejos, comentarios a otros, cosas que arreglar en el propio código, etc
- Milestones: grupos de issues que aplican para un proyecto, característica o periodo de tiempo
- Labels: una manera de organizar diferentes tipos de problemas, etiquetas de tipos de problemas

## Tags
- Tags(etiquetas): puntos específicos en la historia de nuestro proyecto y se usan para marcar alguna versión del mismo
- `git commit –amend -m “Nuevo nombre del commit”`: cambio nombre del commit actual
- `git push origin master -f `: fuerza a que se suban cambios, ya que aunque no haya cambios de código pero sí de commits
- `git tag -a v1.0 -m “Mensaje”`: tags anotadas, son almacenadas como objetos completos dentro de la base de Git y contiene más información, la versión la podemos elegir a gusto como v0.8 si se trata del commit 8, por ejemplo
- `git tag v1.0 `: tags ligeras, son otra forma de crear tags, más simples y con poca información
- `git tag -a v1.0 -m “Mensaje” ‘SHA’`: al agregar el código SHA podemos especificar donde se va aplicar una etiqueta
- `git push origin v1.0`: la versión que seleccionemos de las que tengamos
- `git push origin –tags`: sube todos los tags
- `git show v1.0`:muestra la información sobre esa versión


## Workflows
- workflow: flujo de trabajo con proyectos propios, en equipo o con terceros. 

Lo anterior era todo de proyectos propios lo siguiente es de proyectos en equipo (organizaciones) :
- `git fetch origin`: pone cambios de repositorio remoto a origin/master
- `git merge origin/master`: fusiona, absorbe rama origin/master a rama que estemos
    - fast-forward: los cambios no entran en conflicto
    - auto-merging: los cambios entran en conflicto con los cambios que otra persona del grupo ha realizado
- `git push origin master `: sube cambios


Proyecto con terceros, no somos dueños ni colaboradores, pero queremos participar:
- Fork: hace clon del repositorio original o principal, a diferencia de git. Ahora vamos a tener una rama oculta más, a parte de origin tendremos upstream(pueden haber más mirarlo con git branch -a), upstream/master y origin/master. Clone más para ver proyecto o si se necesita código, cuando hacemos fork es cuando queremos participar en el código.

Primero se hace fork en github del proyecto, se baja proyecto desde el https de nuestro fork, editamos.
- `git fetch upstream`
- `git fetch origin`

## Github pages
Sitios web para nosotros y nuestros proyectos, se puede generar web a partir de nuestra organización o proyecto.

Para nosotros:
1. Crear repositorio nombreusuario.github.io
2. git clone
3. Se crea código web
4. Se sube cambios a github(git push…)

Una vez hecho esto tenemos el dominio: nombreusuario.github.io Lo que tengamos el el repositorio es lo que tendremos en el dominio.

Para proyecto:
1. Creamos repositorio
2. `git clone` + `git branch gh-pages`
3. Se crea código web
4. Se sube cambios a github(`git push…`)
Todo lo que este en la rama gh-pages es lo que aparecera en nuestro dominio. Se crea dominio en: nombreusuario/comunidad.github.io/nombrerepositorio 

## Deployment
Solo si se tiene servidor contratado.
SSH, sirve para conectarse fácilmente a un servidor o servidores, sin tener que poner una contraseña a cada momento.

Con ssh-keygen, generamos llave pública y privada.
Para conectarse al servidor ssh root@dominio.com, dominio o IP en caso de no tener dominio aún.
  
`git pull`: `git fetch` + `git merge`

## Hooks
Mecanismos para activar scripts, cuando suceden ciertas acciones.  
- post-commits, cuando se ejecute `git commit -m “Mensaje”` se ejecutara unos comandos automáticamente para obtener un resultado.
- pos-checkout
- post-merge
- post-rewrite

En .git se encuentra carpet hooks y dentro ya tenemos algunos hooks ya creados. Para crear un hook hacemos, por ejemplo, touch post-commit, y depués nano post-commit para poder escribir el contenido. 


Contenido:
#!/bin/sh  (comentario que indica que es un shell script)
`git push origin rama-o-master`
shh root@dominio.com ‘bash -s’ < deployment.sh (se conecta servidor y ejecuta shell)

Finalmente le damos privilegios al commit, chmod +x post-commit

Ahora se crea deployment, touch deployment.sh

deployment.sh:
#!/bin/sh
cd direccion (se mueve a la carpeta)
`git pull origin rama-o-master`
sudo service ghost restart (reinicia servidor, api ghost)


## Steps
```bash
# 1. Init
git init

# 2. Add changes
git add -A

# 3. Comprobamos archivos añadidos
git status

# 4. 
git commit -m “Mensaje”

# 5. Comprobamos commits
git log

# 6.
git checkout ‘codigo sha’

# 7
git checkout master

# 8.
git reset --soft ‘codigo sha’

# 9.
git branch Rama

# 10.
git checkout Rama1

# 11.
11. Cambios en Rama1

# 12.
git checkout master 

# 13.estamos en master que es la rama que va absorber a Rama1
git merge Rama1 

# 14. eliminamos Rama1
git branch -D Rama1 ()

# 15. GitHub

# 16. Se crea repositorio en GitHub, carpeta y repositorio mejor que tengan el mismo nombre

# 17.
git remote add origin ‘encale https’

# 18. para comprobar
git remote -v

# 19. Descarga, clona y actualiza
git fetch origin
git clone ‘encale https’ 
git pull origin master

# 20. para eliminar enlace entre carpeta y github, en caso de que se quiera
git remote remove origin

# 21. pasa de pc a github
git push origin master

# 22. subimos de pc a github solo rama
git push origin Rama1

# 23. Para borrar rama en GitHub hay que hacerlo desde la página

# 24. Issue, milestones y labels desde GitHub, para 

# 25. Tags (etiquetas de versiones)

# 26. commit numero 8
git tag -a v0.8 -m “Version 0.8 de nuestro proyecto”

# 27. codigo del segundo commit
git tag -a v0.2 -m “Version 0.2 de nuestro proyecto” ‘cogigo sha’

# 28.
git push origin v0.8 (subimos tag a github)

# 29. Workflows

# 30. Comunidades

# 31. muestra ramas ocultas ‘remotes/origin/master’
git branch -a

# 32. subre a rama origin/master
git fetch origin

# 33.
git merge  origin/master

# 34. Proyectos con terceros (fork)

# 35. rama upstream/master es el repositorio original del cual se hace fork
git fetch upstream

# 36. rama origin/master es nuestro repositorio, clon del original
git fetch origin

# 37. Finalmente se hace en github new pull request

# 38. GitHub pages(se crea proyecto)

# 39.
git branch gh-pages
```
