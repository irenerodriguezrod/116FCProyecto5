-- Crear base de datos y usarla. Esto no es necesario, ya que el propio script crea la bd
# create database biblioteca;
# use biblioteca;

-- Crear tablas
create table if not exists libros(
isbn int primary key,
titulo varchar (80),
autor varchar(100),
editorial varchar(80),
genero enum('Novela','Teatro','Ficción','Novela
Autobiográfica','Aventuras'),
pvp float)engine=innodb;

# esto tampoco es ncesario pq no necesitamos ver datos
# describe libros;

create table if not exists usuarios(
nmat int primary key,
nombre varchar(50),
direccion varchar(80),
localidad varchar(100),
provincia varchar(50),
fecha_nac date)engine=innodb;

# describe usuarios;

create table if not exists ejemplares(
isbn int,
num_ejem int,
primary key(isbn, num_ejem),
foreign key(isbn) references libros(isbn)
on delete cascade on update cascade)engine=innodb;

# describe ejemplares;

create table if not exists prestamos(
isbn int,
num_ejem int,
nmat int,
fecha_prest date,
fecha_dev date,
primary key (isbn, num_ejem, nmat, fecha_prest),
foreign key(isbn, num_ejem) references ejemplares(isbn, num_ejem)
on delete cascade on update cascade,
foreign key(nmat) references usuarios(nmat)
on delete cascade on update cascade)engine=innodb;

# describe prestamos;º