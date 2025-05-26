# 🐳 | 01-httpd

## Realización de la actividad y pasos a seguir.

* **Paso 1**. Clonar el repositorio para trabajar con él. Para ello se emplea el siguiente comando:
```
git clone https://github.com/irenerodriguezrod/116FCProyecto5.git
```

Posteriormente cambiaremos a la carpeta que hemos clonado
```
cd 116FCProyecto5
cd 01-httpd
```

* **Paso 2**. Una vez en la carpeta, vamos a definir una nueva red de tipo puente(*Network bridge*). Ejecutamos el siguiente comando:
```
docker network create mi_red
```

* **Paso 3**. Desde la raíz del proyecto, procederemos a construir la imagen, la cual posteriormente necesitaremos.
```
docker build -t mysql_biblioteca_personal .
```
> Lo que hace este comando es construir la imágen desde el Dockerfile. **OJO**, lleva un punto al final del comando

* **Paso 4**. Ejecutar el contenedor con MySQL
```
docker run -d  --rm --name mysql_biblioc --network mi_red  -p 3306:3306 -v mysql_data_biblio:/var/lib/mysql mysql_biblioteca_personal
```
> El comando se podría dividir en partes para poder entenderlo de mejor manera. `docker run` es la orden para ejecutar un nuevo contenedor. `-d` o *modo Detached* es para que el contenedor se ejecute en segundo plano. `--rm` indica que el contenedor se eliminará automaticamente una vez lo detengamos(Esto es muy util para evitar acumular contenedores innecesarios). `--name` asigna el nombre personalizado que queremos que tenga el contenedor para facilitar la gestión del mismo. `--network` conecta el contenedor a la red que hayamos especificado, en este caso *mi_red*, lo cual permite que se comunique con otros contenedores que estén dentro de esa red.`-p 3306:3306` asocia el puerto 3306 del host con el 3306 del contenedor, que es el puerto por defecto de MySQL. Esto permite acceder a MySQL desde fuera del contenedor. `-v mysql_data_biblio:/var/lib/mysql` monta un volumen persistente llamado mysql_data_biblio en el directorio donde MySQL almacena sus datos, asegurando que no se pierdan si el contenedor se elimina. `mysql_biblioteca_personal` es la imagen que se usará para crear el contenedor

* **Paso 5**. Comprobar que el contenedor está en ejecución (*running* o *up*)
```
docker ps
```
> Si utilizaramos `docker ps -a`veríamos todos los contenedores (incluyendo los que están *Exited* o *Stop*)

* **Paso 6**. Crear el contenedor de phpMyAdmin.
>*phpMyAdmin* es una herramienta web escrita en *PHP* que permite **administrar bases de datos MySQL o MariaDB** a través de un interfaz gráfico fácil de usar, en lugar de hacerlo desde línea de comandos.
>Variable de entorno **PMA_HOST=mysql_biblioc** es un argumento que se utiliza en la ejecución de contenedores *Docker*, especialmente cuando se usa una imagen *phpMyadmin*.
>**PMA_HOST**: se especifica el *host* del servidor *MySQL* o *MariaDB* al que *phpMyAdmin* debe conectarse.

Para ello vamos a utilizar el siguiente comando:
```
docker run -d --rm --name phpadmin_biblioc --network mi_red -e PMA_HOST=mysql_biblioc -p 8080:80 phpmyadmin
```
> Lo que hace el comando es crear el contenedor *php* al igual que el anterior, al pararlo se borrará. Este contenedor esta funcionando en los puertos 8080 del host y en el 80 del contenedor

Volveremos a comprobar, esta vez vamos a ver que ambos contenedores están ejcutandose:
```
docker ps
```

* **Paso 7**. Mostrar los volúmenes que estamos utilizando
En este caso ambos están empleando `mysql_data_biblio` 
```
docker volume ls
```

* **Paso 8**. Comprobar que ambos contenedores están conectados con la conexión que hemos creado anteriormente
```
docker network inspect mi_red
```

* **Paso 9**. Comprobar que funciona desde el navegador 
Para ello tenemos que dirigirnos al navegador e introducir el siguiente URL:
```
http://localhost:8080 
```
> *localhost* porque es la propia máquina que estamos utilizando el lugar en el que se están ejecutando, y 8080 porque es el puerto que estamos utilizando, se definió a la hora de crear el contenedor de phpMyAdmin(`-p 8080:80` lo cual significa que externamente funciona en el puerto 8080 para acceder a él y 80 es el puerto interno sobre el que trabaja). El usuario y la contraseña son los que están definidos en el [Dockerfile](https://github.com/irenerodriguezrod/116FCProyecto5/blob/main/Dockerfile)


**📝 Última actualización:** lunes 26 de mayo de 2025