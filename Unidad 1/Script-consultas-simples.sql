-- Consultal simples con Select - SQL-LMD
Use NORTHWND
--Consulta numero 1 Seleccionar todos los clientes

select * from Customers

--Seleccionar el nombre del cliente, nombre del contacto y la ciudad

select CompanyName, ContactName, City from Customers

--Selccionar todos los paises de los clientes (distinct)

select country from Customers

select distinct country from Customers /*quita valores repetidos*/

--seleciona el mumero de paises de donde son mis clientes (count)
select COUNT(*) from Customers

select COUNT(Country) from Customers

select COUNT(distinct country) from Customers

--Seleccionar el cliente que tenga un id Anton

select * from Customers
where CustomerID = 'ANTON'

--seleccionar todos los clientes de Mexico

select * from Customers
where Country = 'Mexico'

--seleccionar todos los registros de los clientes de Berlin

select * from Customers
where City = 'Berlin'

select CompanyName, city, country from Customers
where city = 'Berlin'

--Order by  asc/desc
--seleccionar todos los producto por precio

select * from Products
order by UnitPrice 

--seleccionar todos los productos ordenados por el precio de mayor a menor

select * from Products
order by  UnitPrice desc

--seleccionar todos los productos alfabeticamente

select * from Products
order by  ProductName 

--seleccionar todos los clientes por pais y dentro por nombre de forma ascedente

select   Country,City,CompanyName from Customers
order by  country desc, CompanyName asc

--Operador and
--Seleccionar todos los clientes de España y que su nombre comience con G

select Country, city, CompanyName from Customers
where Country= 'Spain'and CompanyName like 'G%'

--seleccionar todos los clientes de Berlin, Alemania con un codigo postal mayor a 2200
select* from Customers
select country, city, PostalCode from Customers
where city= 'Berlin'  and  PostalCode > 2200

--seleccionar todos los clientes de España y que su nombre comience con G o con R
select Country, city, CompanyName from Customers
where Country= 'Spain'and( CompanyName like 'G%' or CompanyName like 'R%')

--Clausula or 
--Seleccionar todos cliente de Alemania o España

select Country, city, CompanyName from Customers
where Country= 'Spain' or Country= 'Germany'

--Seleccionar todo los clientes de Berlin o de Nouega o que comience su nombre con G

select Country, city, CompanyName from Customers
where City = 'Berlin' or Country= 'Norway' or CompanyName like 'G%'

--Seleccionar solo los clientes que no son de España

select * from Customers
where not Country = 'Spain'

--Seleccionar todos los clientes  que no tengan un precio entre 
--18 y 20 USD

select * from Products
where not (UnitPrice >= 18 and UnitPrice <= 20)

select * from Products
where  UnitPrice not between 18 and 20


--Seleccionar todos los clientes que no son de paris o de londres

select CompanyName,City from Customers
where not (City='Paris' or City ='London') 

select * from Customers
where  city not in ('Paris', 'London')

--Seleccionar todos los productos que no tienen precios mayores a 30 

select  UnitPrice from Products
where not UnitPrice > 30
--Seleccionar todos los produc<tos que no tiene precios menores a 30

select UnitPrice from Products
where not UnitPrice < 30


--Instruccion like

--Seleccionar todos los clientes que comienzan con la letra A
select Country, city, CompanyName from Customers
where  CompanyName like 'A%'

--Seleccionar todos los clientes que finalizan con la palabra "es"
select Country, city, CompanyName from Customers
where  CompanyName like '%es'

--Seleccionar todos los clientes que contengas la palabra "mer"
select Country, city, CompanyName from Customers
where  CompanyName like '%mer%'

--Seleccionar todos los clientes con una Ciudad que comience 
--con cualquier caracter segido de la palabra ondon(_)

select Country, city, CompanyName from Customers
where  City like '_ondon'
