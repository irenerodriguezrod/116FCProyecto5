# 🐳 | 02-php-apache

## Realización de la actividad y pasos a seguir.

# En caso de querer seguir los pasos SIN CLONAR EL REPOSITORIO
* **Paso 1**. Crear una nueva carpeta dentro de la ya existente (`116FCProyecto5`) con el nombre `02-php-apache`. Una vez creada, vamos a entrar dentro de ella y crearemos los archivos mencionados en el siguiente paso:
```
mkdir 02-php-apache
cd 02-php-apache
```

* **Paso 2**. Crearemos una carpeta llamada `src` dentro de la cual irá un archivo llamado `index.php`que será el que veremos al entrar a la web con `localhost`:
```
mkdir src
touch docker-compose.yml
touch src/index.php
```

* **Paso 3**. Buscar la versión que vamos a utilizar para nuestro servidor de apache. En este caso utilizaremos la `8.2-apache`
[Docker Hub - 8.2-Apache ](https://hub.docker.com/_/php/tags?name=8.2-apache)

  - Contenido `docker-compose.yml`
    ```
    version: '3'

    services: 
        webphp:
        image: php:8.2-apache
        ports:
        - 8080:80 # expone el puerto 8080
        volumes:
        - ./src:/var/www/html
    ```
  - Contenido `src/index.php`
    ```
    <?php
        // script es test evaluar instalacion php
        phpinfo();
    ?>
    ```

* **Paso 4**. Levantar el contenedor
  > Ojo, hay que estar dentro de la carpeta 02-php-apache
  
  ```
  docker-compose up
  ```

* **Paso 5**. Comprobar que está funcionando
Como hemos ejecutado el comando en primer plano, la consola queda bloqueaada por lo que, para seguir utilizando comandos tendremos que abrir una nueva terminal y ejecutaremos lo siguiente:
```
docker-compose ps
```

* **Paso 6**. Acceder al navegador para visualizar el contenido
```
http://localhost:8080
```

* **Paso 7**. Una vez realizado el ejercicio, bajamos el contenedor y comprobamos que ya no existe:
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
```
docker-compose ps
```

* **Paso 4**. Acceder al navegador para visualizar el contenido
```
http://localhost:8080
```

* **Paso 5**. Una vez realizado el ejercicio, bajamos el contenedor y comprobamos que ya no existe:
```
docker-compose down
docker-compose ps
```

**📝 Última actualización:** lunes 26 de mayo de 2025