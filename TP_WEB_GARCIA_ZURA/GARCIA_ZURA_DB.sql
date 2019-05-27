drop database GARCIA_ZURA_DB_PROMO
go
CREATE DATABASE GARCIA_ZURA_DB_PROMO
GO
USE GARCIA_ZURA_DB_PROMO
GO
CREATE TABLE Vouchers (
	codigo	varchar(10) primary key not null,
	estado	bit not null default 1,

)
GO
CREATE TABLE Clientes (
	DNI	varchar(8)	not null primary key,
	Nombre	varchar(30) not null,
	Apellido varchar(30) not null,
	Email	varchar(50) not null,
	Direccion	varchar(50) not null,
	Ciudad	varchar(50) not null,
	CP	varchar(6) not null
)
GO
CREATE TABLE Premios (
	ID	int primary key identity(1, 1) not null,
	Titulo	varchar(30) not null,
	Descripcion	varchar(50) not null,
	Imagen	varchar(200) not null
)
GO
CREATE TABLE Premios_X_Clientes (
	IDPremio	int	foreign key references Premios(ID) not null,
	DNI	varchar(8) foreign key references Clientes(DNI) not null,
	IDVoucher varchar(10) foreign key references Vouchers(codigo) not null,
	primary key(IDPremio, DNI,IDVoucher)
)
GO
INSERT INTO Vouchers (codigo)
VALUES ('9722PXVYV9'), ('N4TGDFWGWY'), ('X62XNYC6YC'),
('FBMCCBPQ5M'), ('7UTQD6GW92'), ('E8RXNRTX5G'), ('W6D3UXHPR9'),
('KSH697ERP3'), ('Q645A5CRAK'), ('GQSHRYL2WX')
GO
INSERT INTO Premios (Titulo, Descripcion, Imagen)
VALUES ('Notebook', 'HP 250 G6 i5 4GB 1TB', 'https://store.hp.com/SpainStore/Html/Merch/Images/c05456656_1750x1285.jpg'),
('SmartWatch MOTO 360', 'Motorola 1 generacion', 'http://www.cellshop.com/v2/59540-large_default/reloj-motorola-moto-360-grafito.jpg'),
('Mochila Solar', 'Tiene para cargar el celular !', 'https://deltavolt.pe/images/Voltaics/voltaic_array1.jpg')





