create database Auto_Smart_Parking;

use Auto_Smart_Parking;


create table Rol (
IdRol int(10),
Tipo_Rol varchar (10),
primary key (IdRol));


create table Cupo(
IdCupo int(10),
Cod_vehiculo int(10),
No_de_Esp int(10),
Disponible char(1),	
primary key (IdCupo));


create table Tipo_Vehiculo (
IdTipo_Vehiculo int(10),
Descripcion varchar(60),
primary key (IdTipo_Vehiculo));

create table Vehiculo (
IdVehiculo int(10),
placa varchar (6),
marca varchar(45),
modelo int(4),
color varchar(45),
IdTipo_Vehiculo int(10),
foreign key(IdTipo_Vehiculo) REFERENCES Tipo_Vehiculo (IdTipo_Vehiculo),
primary key (IdVehiculo));

create table Parqueadero(
IdParqueadero int(10),
Nombre varchar (20),
Direccion varchar(30),
Telefono int(10),
IdCupo int (10),
FOREIGN KEY(IdCupo) REFERENCES Cupo (IdCupo),
primary key (IdParqueadero));



create table Tipo_Documento (
IdTipo_Documento int(10),
Tipo_Documento varchar(10),
primary key (IdTipo_Documento));



create table Documento (
IdDocumento int(10),
IdTipo_Documento int(10),
No_Documento int (10),
FOREIGN KEY(IdTipo_Documento) REFERENCES Tipo_Documento (IdTipo_Documento),
primary key (IdDocumento));


create table Usuario (
IdUsuario int(10),
IdRol int(10),
IdDocumento int(10),
Nombre varchar(45),
Telefono varchar(10),
Correo varchar(45),
Direccion varchar(50),
Genero char (1),
Nombre_Usuario varchar (10),
Contraseña varchar(100),
IdParqueadero int(10),
FOREIGN KEY(IdRol) REFERENCES Rol (IdRol),
FOREIGN KEY(IdParqueadero) REFERENCES Parqueadero (IdParqueadero),
FOREIGN KEY(IdDocumento) REFERENCES Documento (IdDocumento),
primary key (IdUsuario));



create table Control_Registro(
IdControl_Registro int(10),
IdUsuario int(10),
IdVehiculo int(10),
IdParqueadero int(10),
FechaEntrada Datetime (6),
FechaSalida Datetime (6),	
FOREIGN KEY(IdUsuario) REFERENCES Usuario (IdUsuario),
FOREIGN KEY(IdVehiculo) REFERENCES Vehiculo (IdVehiculo),
FOREIGN KEY(IdParqueadero) REFERENCES Parqueadero (IdParqueadero),
primary key (IdControl_Registro));



