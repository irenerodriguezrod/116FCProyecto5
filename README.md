# 116FCProyecto5 
## 🐳 | Docker Compose con diferentes escenarios de despliegue

> ⚠️ Esta actividad ha sido desarrollada en Ubuntu, por lo que los comandos y configuraciones descritos están adaptados a dicho sistema operativo.

El objetivo de esta actividad es trabajar con los comandos de Docker Compose en diferentes escenarios. En este caso trabajaremos con un servidor de bases de datos y un servidor web que nos servirá para la gestión de manera visual. Los servidores trabajados en la actividad son los siguientes:
* Un **servidor de base de datos MySQL**.
* Un **servidor web phpMyAdmin** para la gestión visual de la base de datos.

El enfoque que se utiliza en esta actividad es similar al realizado en la actividad anterior [Proyecto 4](https://github.com/irenerodriguezrod/116FCProyecto4), ya que ambos comparten una estructura de carpetas organizada y reutilizan conceptos similares.

## Índice de los diferentes escenarios

A continuación, se describen los distintos entornos configurados durante la actividad. Cada uno representa un escenario diferente de despliegue utilizando Docker Compose.

### 📁 01-httpd

En este apartado se lanza un contenedor con un servidor **Apache HTTP (httpd)**. Este servicio sirve una página web estática en HTML. Es un escenario ideal para probar el despliegue básico de contenido web estático sin la necesidad de utilizar PHP o bases de datos.

**Estructura del directorio:**

```
01-httpd/
├── docker-compose.yml         # Define el contenedor con la imagen httpd y configura el volumen para servir archivos estáticos.
└── src/
    └── index.html             # Página principal HTML que se servirá desde el contenedor.
```

### 📁 02-php-apache

**Descripción:**
Escenario que combina Apache con soporte para **PHP**, permitiendo ejecutar scripts del lado del servidor. Aquí permite visualizar desde el navegador una página realizada en PHP

**Estructura del directorio:**

```
02-php-apache/
├── docker-compose.yml         # Configura un contenedor con Apache y PHP.
└── src/
    └── index.php              # Script PHP que se ejecutará en el servidor. En este caso una web de información sobre PHP
```

### 📁 03-mysql-phpmyadmin
Escenario que levanta un sistema de base de datos completo compuesto por dos servicios:

* Un contenedor con **MySQL**.
* Un contenedor con **phpMyAdmin** para administrar MySQL desde el navegador.

Este escenario es muy útil para entornos de desarrollo donde se necesita gestionar bases de datos de forma gráfica y rápida sin instalar software adicional.

**Estructura del directorio:**

```
03-mysql-phpmyadmin/
├── .env                       # Archivo con variables de entorno sensibles (usuario, contraseña, nombre de la base de datos, etc.).
└── docker-compose.yml         # Define los dos servicios: MySQL y phpMyAdmin, y configura las redes y puertos necesarios.
```

## Última revisión
**📝:** lunes 26 de mayo de 2025