# Churros El Topo

Proyecto de clase de Churros El Topo.

Ir agregando contenido relevante al proyecto modificando este archivo con el formato MD con [StackEdit](https://stackedit.io).

# Lista de Comandos
## Primer paso, posicionarme en mi *branch*
Luego de crear el branch en el que vas a trabajar crear una carpeta vacía, e inicializar tu branch con los siguientes comandos.

    git init
    git remote add origin git@gitlab.com:marcoss2009/churroseltopo.git
    git fetch
    git checkout -t origin/BRANCH
    

## Subir actualizaciones
Para subir actualizaciones posicionarse en la carpeta donde estas trabajando y ejecutar los siguientes comandos.

    git add .
    git commit -am "Descripción corta de la actualización"
    git push -u origin TU BRANCH
    
## Descargar actualizaciones del branch *master*

Les recomiendo que para descargar el proyecto principal (del branch *master*) lo hagan en una carpeta aparte y ejecutar los siguientes comandos.
REPETIR LOS COMANDOS DEL PASO 1 **PERO EN VEZ DE PONER TU BRANCH PONER *master*.**

    git checkout -t origin/master
    
Luego, cada vez que quieras ver las actualizaciones del branch master ejecutar los siguientes comandos.

    git fetch origin
    git reset --hard origin/master