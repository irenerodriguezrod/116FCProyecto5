# 🐳 | 03-mysql-phpmiadmin

## Realización de la actividad y pasos a seguir.

# En caso de querer seguir los pasos SIN CLONAR EL REPOSITORIO
* **Paso 1**. Crear una nueva carpeta dentro de la ya existente (`116FCProyecto5`) con el nombre `03-mysql-phpmiadmin`. Una vez creada, vamos a entrar dentro de ella y crearemos los archivos mencionados en el siguiente paso:
```
mkdir 03-mysql-phpmiadmin
cd 03-mysql-phpmiadmin
```

* **Paso 2**. Crearemos una carpeta llamada `src` dentro de la cual irá un archivo llamado `index.php`que será el que veremos al entrar a la web con `localhost`:
```
touch .env
touch docker-compose.yml
```

* **Paso 3**. Agregar contenido a los archivos mencionados anteriormente

  - Contenido `.env`
    ```
    MYSQL_ROOT_PASSWORD=root
    MYSQL_DATABASE=database
    MYSQL_USER=user
    MYSQL_PASSWORD=password
    ```

  - Contenido `docker-compose.yml`
    ```
    version: '3'

    services:
        mysql:
        image: mysql:8.0
        ports:
            - 3306:3306
        environment:
            - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
            - MYSQL_DATABASE=${MYSQL_DATABASE}
            - MYSQL_USER=${MYSQL_USER}
            - MYSQL_PASSWORD=${MYSQL_PASSWORD}
        volumes:
            - mysql_data:/var/lib/mysql
        restart: always

    phpmyadmin:
        image: phpmyadmin
        ports:
            - 8080:80
        environment:
            - PMA_HOST=mysql
        depends_on:
            - mysql
        restart: always

    volumes:
        mysql_data:
    ```

* **Paso 4**. Levantar el contenedor
  > Ojo, hay que estar dentro de la carpeta 03-mysql-phpmiadmin
  
  ```
  docker-compose up
  ```

* **Paso 5**. Comprobar que está funcionando
Como hemos ejecutado el comando en primer plano, la consola queda bloqueaada por lo que, para seguir utilizando comandos tendremos que abrir una nueva terminal y ejecutaremos lo siguiente:

> Este paso es importante, ya que necesitamos saber el nombre del contenedor para poder seguir con los próximos pasos

```
docker-compose ps
```

* **Paso 6**. Comprobar que `MySQL`funciona, para ello vamos a acceder al contenedor en modo comando. Ejecutaremos el siguiente comando:
```
docker exec -it 03-mysql-phpmiadmin_mysql_1 mysql -p
```
> El contenedor utilizado es el que esta ubicado en el puerto `3306`ya que el otro contenedor(el que se encuentra en el puerto `8080`es el que visualizaremos desde el navegador mediante `http://localhost:8080`)

* **Paso 7**. Ejecutar comandos dentro del servidor. En este caso, la base de datos `database`se encuentra vacía, por lo que vamos a crear una tabla de prueba y visualizaremos los datos creados por comando. En los próximos pasos, lo haremos desde el navegador.
```
SHOW DATABASES ; # Para comprobar las bases de datos que hay creadas

USE database; # Seleccionar base de datos sobre la que vamos a trabajar

CREATE TABLE IF NOT EXISTS prueba(id INT PRIMARY KEY, nombre VARCHAR(50), apellido VARCHAR(50))engine=innodb; # Crear una tabla de prueba

DESCRIBE prueba; # Ver las columnas que hay en la tabla y los valores que puede tomar cada uno

SHOW TABLES; # Para ver las tablas que hay en la base de datos sobre la que estamos trabajando

SELECT * FROM prueba; # Ver los valores que hay en las columnas. En este caso no hemos añadido ninguno, por lo que no saldría nada
```

* **Paso 8**. Se entra desde el navegador para poder acceder al servidor de PHP. Es 8080 porque es el puerto que le definimos en el archivo docker-compose.yml
Al acceder, nos aparecerá la pantalla de login para phpMyAdmin, introduciremos las credenciales necesarias para acceder.

```
http://localhost:8080
```
> Las credenciales son las que hemos indicado anteriormente en el archivo `.env`en este caso, si queremos acceder como root los valores serían los siguientes
```
usuario: root
contraseña/password: root
```

Visualizaremos los datos que nos aparecen, y veremos que son los mismos que habíamos comprobado con los comandos anteriores desde la terminal de MySQL.

* **Paso 9**. Una vez realizado el ejercicio, bajamos el contenedor y comprobamos que ya no existe:
```
docker-compose down
docker-compose ps
```

# En caso de querer seguir los pasos con el REPOSITORIO CLONADO
* **Paso 1**. Clonar el repositorio para trabajar con él. Para ello se emplea el siguiente comando:
```
git clone https://github.com/irenerodriguezrod/116FCProyecto5.git
```

Posteriormente cambiaremos a la carpeta que hemos clonado
```
cd 116FCProyecto5
cd 02-php-apache
```

* **Paso 2**. Levantar el contenedor
> Ojo, hay que estar dentro de la carpeta 02-php-apache  
```
docker-compose up
```

* **Paso 3**. Comprobar que está funcionando
Como hemos ejecutado el comando en primer plano, la consola queda bloqueaada por lo que, para seguir utilizando comandos tendremos que abrir una nueva terminal y ejecutaremos lo siguiente:

> Este paso es importante, ya que necesitamos saber el nombre del contenedor para poder seguir con los próximos pasos

```
docker-compose ps
```

* **Paso 4**. Comprobar que `MySQL`funciona, para ello vamos a acceder al contenedor en modo comando. Ejecutaremos el siguiente comando:
```
docker exec -it 03-mysql-phpmiadmin_mysql_1 mysql -p
```
> El contenedor utilizado es el que esta ubicado en el puerto `3306`ya que el otro contenedor(el que se encuentra en el puerto `8080`es el que visualizaremos desde el navegador mediante `http://localhost:8080`)

* **Paso 5**. Ejecutar comandos dentro del servidor. En este caso, la base de datos `database`se encuentra vacía, por lo que vamos a crear una tabla de prueba y visualizaremos los datos creados por comando. En los próximos pasos, lo haremos desde el navegador.
```
SHOW DATABASES ; # Para comprobar las bases de datos que hay creadas

USE database; # Seleccionar base de datos sobre la que vamos a trabajar

CREATE TABLE IF NOT EXISTS prueba(id INT PRIMARY KEY, nombre VARCHAR(50), apellido VARCHAR(50))engine=innodb; # Crear una tabla de prueba

DESCRIBE prueba; # Ver las columnas que hay en la tabla y los valores que puede tomar cada uno

SHOW TABLES; # Para ver las tablas que hay en la base de datos sobre la que estamos trabajando

SELECT * FROM prueba; # Ver los valores que hay en las columnas. En este caso no hemos añadido ninguno, por lo que no saldría nada
```
* **Paso 6**. Se entra desde el navegador para poder acceder al servidor de PHP. Es 8080 porque es el puerto que le definimos en el archivo docker-compose.yml
Al acceder, nos aparecerá la pantalla de login para phpMyAdmin, introduciremos las credenciales necesarias para acceder.

```
http://localhost:8080
```
> Las credenciales son las que hemos indicado anteriormente en el archivo `.env`en este caso, si queremos acceder como root los valores serían los siguientes
```
usuario: root
contraseña/password: root
```

Visualizaremos los datos que nos aparecen, y veremos que son los mismos que habíamos comprobado con los comandos anteriores desde la terminal de MySQL.

* **Paso 7**.Una vez realizado el ejercicio, bajamos el contenedor y comprobamos que ya no existe:
```
docker-compose down
docker-compose ps
```

**📝 Última actualización:** martes 27 de mayo de 2025