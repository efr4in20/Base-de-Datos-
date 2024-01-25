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