Create database bdmistecnology; 
use bdmistecnology; 


Create table Usuario(
cod_Usuario int primary key Auto_increment not null,
Nombre_Tecnico varchar (20) not null,
Telefono_Tecnico Varchar (15) not null,
Celular_Tecnico int not null,
Correo_Tecnico varchar (30) not null,
Nombre_Cliente varchar (20) not null,
Telefono_Cliente Varchar (15) not null,
Celular_Cliente int not null,
Correo_Cliente varchar (30) not null,
cod_MantenimientoFK int null,
No_ReporteFK int null,
Cod_Diagnostico_EntradaFK int null,
Cod_Diagnostico_SalidaFK int null,
Cod_incidenciasFK int null
);

Create table Mantenimiento(
Cod_Mantenimiento int primary key Auto_increment not null ,
Tipo_Mantenimiento varchar (15),
Fecha_Entrega date,
Fecha_Salida date,
Observaciones varchar (50),
Cod_EquipoFK int
);

Create table Software(
Cod_Software int primary key Auto_increment not null,
Arquitectura varchar (15) not null,
Tipo_de_SO Varchar (20) not null,
Caducacion_Licencia Varchar (30) not null,
Sistema_Operativo Varchar (20) not null
);

Create table Bitacora(
No_Reporte int primary key Auto_increment not null,
Causa_Fallo Varchar (50) not null,
Fecha_Entrega date not null,
Fecha_Salida date not null

);

Create table reporte_incidencias(
Cod_incidencias int primary key Auto_increment not null,
nombre_cliente Varchar (20) not null,
telefono_contacto varchar (15) not null,
identificacion_cliente int not null,
motivo_registro Varchar (50) not null,
Area_cliente Varchar (20) not null,
Fecha_reporte date not null
);

CREATE TABLE Configuracion_red (
    Cod_Red INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Direccion_IP INT,
    Direccion_Mac VARCHAR(25)
);

 CREATE TABLE Tarjeta_red (
Cod_Tarjeta_Red int primary key Auto_increment not null,
 Nombre_tabla_Tarjeta_Red Varchar (25),
Marca_integrada varchar (10) not null,
Marca_Adicional varchar (10) not null,
Puertos_usb varchar (10) not null,
velocidad_integrada varchar (15) not null,
velocidad_adicional varchar (15) not null

);


Create table Diagnostico_entrada (
Cod_Diagnostico_Entrada int primary key Auto_increment not null,
Estado_Equipo varchar (20) not null,
Fecha_Entrega date not null,
Proceso_Realizar Varchar (50)
);

create table Diagnostico_salida( 
Cod_Diagnostico_Salida int primary key auto_increment not null,
Estado_Salida date not null,
Fecha_salida date not null,
Proceso_Realizado Varchar (50) not null
);
Create table Equipo(
Cod_Equipo int primary key Auto_increment not null,
Cod_HardwareFK int,
Cod_SoftwareFK int,
Cod_Diagnostico_EntradaFK int,
Cod_Diagnostico_SalidaFK int,
No_ReporteFK int,
Cod_RedFK Int,
Cod_incidenciasFK int

);

Create table Hardware(
Cod_Hardware int primary key Auto_increment not null,
Marca_de_equipo Varchar (15) not null,
Pantalla Varchar (6) not null,
Memoria_Ram Varchar (10),
Procesador Varchar (30) not null,
Velocidad_Procesador Varchar (15) not null,
Nucleo int not null,
Disco_Duro Varchar (15) not null,
Capacidad_Disco_Duro Varchar (15) not null,
Tipo_Tarjeta_Video Varchar (15) not null,
Puertos_USB Varchar (15) not null,
Tipo_Disco_Flexible Varchar (15) not null,
Cod_Tarjeta_RedFK int
);

ALTER TABLE Usuario
add constraint FkMantenimiento
Foreign Key(cod_MantenimientoFK)
REFERENCES Mantenimiento(Cod_Mantenimiento);

Alter table Usuario
add constraint FKNo_Reporte
foreign key(No_ReporteFK)
REFERENCES Bitacora (No_Reporte);

alter table Usuario
add constraint FKDiagnostico_entrada
foreign key (Cod_Diagnostico_EntradaFK)
references Diagnostico_entrada (Cod_Diagnostico_Entrada);

alter table Usuario
add constraint FKDiagnostico_Salida
foreign key (Cod_Diagnostico_SalidaFK)
references Diagnostico_Salida(Cod_Diagnostico_Salida);

alter table Usuario
add constraint FKreporte_incidencias
foreign key (Cod_incidenciasFK)
references reporte_incidencias(Cod_incidencias);

alter table Mantenimiento
add constraint FKEquipo
foreign key (Cod_EquipoFK)
references Equipo(Cod_Equipo);

alter table Equipo
add constraint FKHardware
foreign key (Cod_HardwareFK)
references Hardware (Cod_Hardware);

alter table Equipo
add constraint FKSoftware
foreign key (Cod_SoftwareFK)
references Software (Cod_Software);

alter table Equipo 
add constraint FKDiagnostico_entrada
foreign key (Cod_Diagnostico_EntradaFK)
references Diagnostico_entrada(Cod_Diagnostico_Entrada);

alter table Equipo
add constraint FKDiagnostico_salida
foreign key (Cod_Diagnostico_SalidaFK)
references Diagnostico_salida(Cod_Diagnostico_Salida);

alter table Equipo
add constraint FKBitacora
foreign key (No_ReporteFK)
references Bitacora(No_Reporte);

alter table Equipo
add constraint FKConfiguracion_red
foreign key (Cod_RedFK)
references Configuracion_red (Cod_Red);

alter table Equipo
add constraint Fkreporte_incidencias
foreign key (Cod_incidenciasFK)
references  reporte_incidencias (Cod_incidencias);


alter table Hardware
add constraint FKTarjeta_red
Foreign key (Cod_Tarjeta_RedFK)
references  Tarjeta_red (Cod_Tarjeta_Red);

select * from Hardware;


insert into Usuario(cod_Usuario,Nombre_Tecnico,Telefono_Tecnico,Celular_Tecnico,Correo_Tecnico,Nombre_Cliente,Telefono_Cliente,Celular_Cliente,Correo_Cliente)
values (000,'Flor_Alba','6583600',3125601533, 'floralba17@gmail.com','juan_perez', '6585800',3505901523,'juanperez232@gmail.com'),
(001,'Maria_jimenez','4578960', 3215981503,'mj23554@gmail.com', 'diego_ramirez','4879806',3129518035,'dr354@gmail.com');


insert into Mantenimiento(Cod_Mantenimiento,Tipo_Mantenimiento,Fecha_Entrega,Fecha_Salida,Observaciones)
values (0000,'predictivo', "2021-21-04", "2021-23-04", 'estadoregular'),

(0001,'correctivo', "2021-27-04", "2021-30-04",'estadomalo');

select* from  Diagnostico_salida;

insert into Software (Cod_Software,Arquitectura,Tipo_de_SO,Caducacion_Licencia,Sistema_Operativo)
values ('', '64 bits','libre','N/A','linux'),
('','32 bits','licenciado','caduca en tres años', 'windows'); 

insert into Bitacora (No_Reporte, Causa_Fallo,Fecha_Entrega,Fecha_Salida)
values ('','no prende',"19-04-2021", "21-04-2021"),
 ('','problemas de tarjeta grafica',"20-04-2021","23-04-2021");

insert into reporte_incidencias (Cod_incidencias,nombre_cliente,telefono_contacto,identificacion_cliente,motivo_registro,Area_cliente,Fecha_reporte)
values ('','maria jose','6508300',23689599,'se apaga en el momento del uso','administracion', "18-04-2021"),
('','jorge cardenas','48790834',1001085736,'no emite sonido','recursos humanos',"15-04-2021");

insert into  Configuracion_red (Cod_Red,Direccion_IP,Direccion_Mac)
values ('',1921681471,2552552550),
('',19016281742,2552552550);

insert into Tarjeta_red  (Cod_Tarjeta_Red,Nombre_tabla_Tarjeta_Red,Marca_integrada,Marca_Adicional,Puertos_usb,velocidad_integrada,velocidad_adicional)
values ('', 'arcnet','pci','N/A','4','N/A', '1.0gbps'),
('', 'ethernet','pci','N/A','4','N/A', '2.0gbps');


insert into Diagnostico_entrada (Cod_Diagnostico_Entrada, Estado_Equipo, Fecha_Entrega, Proceso_Realizar)
values ('','regular',"19-04-2021",'se revisan los fallos'),
('','malo',"20-04-2021", 'se revisan los fallos');


insert into Diagnostico_salida(Cod_Diagnostico_Salida,Estado_Salida,Fecha_salida,Proceso_Realizado)
values ('', 'bueno',"21-04-2021",'se realiza un cambio de fuente de poder'),
('', 'bueno', "23-04-2021", 'Se realiza un cambio de tarjeta de red');



insert into  Hardware(Cod_Hardware,Marca_de_equipo,Pantalla,Memoria_Ram,Procesador,Velocidad_Procesador,Nucleo,Disco_Duro,Tipo_Tarjeta_Video,Puertos_USB,Tipo_Disco_Flexible)
values ('','samsung','crt', 'ddr4','AMD','1.29 GHz','4','SATA','integrada','4','si cuenta'),
('','hp','led', 'ddr3','intel','1.24 GHz','4','SSCI','integrada','4','no cuenta');