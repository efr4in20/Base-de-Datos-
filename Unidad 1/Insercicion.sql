
-- Lenguaje SQL- Manipulacion de datos (SQL-LMD) insert, delete, update, select

--Seleccionar todos los datos de la categoria

select * from Categoria

--Agregar una solo fila a una tabla  (Categoria) 

insert into Categoria
values (1, 'Carnes frias')
insert into Categoria
values (2, 'Lacteos')
insert into Categoria
values (3, 'Vinos y licores')
insert into Categoria
values (4, 'Ropa')

insert into Categoria (CategoriaId, Descripcion)
values (5, 'Linea Blanca')

insert into Categoria (CategoriaId, Descripcion)
values (6, 'Electronica')

-- insertar varios registros a la vez

insert into Categoria 
values ( 7, 'Carnes Buenas'),
(8, 'Dulces'),
(9, 'Panaderia'),
(10, 'Salchichineria')

--insertar apartir de una consulta

create table categoriaCopia (
	CategoriaID int not null primary key,
	nombre varchar (100) not null

	)
insert into categoriaCopia(CategoriaID,nombre)
select CategoriaId, Descripcion from Categoria
 
 select * from categoriaCopia
-- Actualizacion de datos SQL-lmd

 select * from Producto

 insert into Producto 
 values (1,'Salchica',600,12,1)

 insert into Producto
 values (2,'Paleta de Pollo',22,56,8)

  insert into Producto
 values (3,'Refrigerador',3000,22,5),
 (4,'Chilindrina',23,43,9),
 (5,'Terrible Mezcal',200,12,3),
 (6,'Leche de burra',2350,3,2)


 -- Update 

 update Producto
 set ProductoId = 2
 where nombre = 'Paleta de pollo'

 update Producto
 set nombre = 'Salchicha Grande',
	existencia = 20 
	where ProductoId = 1

 alter table Producto
 add constraint pk_producto
 primary key (idproducto)


 --Elimiar registros de una tabla

/* 
	delete from table 
	where expresion
*/

  

delete from Producto
where ProductoId = 4 

delete from Producto
where nombre = 'Salchicha Grande'

delete from Producto
where Precio >=3 and Precio<=22

delete from Producto
where Existencia >=3 and Existencia<=12