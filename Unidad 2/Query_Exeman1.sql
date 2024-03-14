--1 Obten el nombre del producto y la cantidad total vendida para los productos
--vendidos en 1997, ordenados por la cantidad toral en orden descendente

Select p.ProductName as 'Nombre del Producto', (od.Quantity * od.UnitPrice)
as 'Importe' from [Order Details]
as od inner join Products as p
on p.ProductID = od.ProductID 
inner join Orders as o on o.OrderID = od.OrderID
where year(o.OrderDate) = '1977'
order by 2 desc

--2 Muestra el nombre del cliente y la cantidad total gastada por cada cliente
-- que haya realizado al menos una compra, ordenado por la cantidad total gastada en orden descendente
Select c.CompanyName as 'Cliente', count (*) as  'Cantidad de compras'
from Orders as o inner join Customers as c on o.CustomerID = c.CustomerID
group by C.CompanyName
having COUNT(*)>1

--3 Lista los productos que no han sido ordenados, ordenados alfabeticamente por nombre del producto

Select*from Products as p 
left join [Order Details] as od on p.ProductID = od.ProductID
Order by p.ProductName asc

--4 Muestra la cantidad total de productos vendidos por cada categoria de productos, solo para categorias
-- que tengan mas de 10 productos vendidos en total

Select c.CategoryName, count(*) as 'Total' 
from Categories as c
inner join Products as p 
on c.CategoryID = p.CategoryID 
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
having COUNT(*)>1

--Obtiene el nombre del producto y el nombre del proveedor para cada producto
--que tiene un precio mayor a $50 ordenados por nombre del proveedor y nombre de producto.

Select s.CompanyName as 'Nombre del provedor', p.ProductName as 'Nombre del Producto'
from Products as p 
inner join Suppliers as s on p.SupplierID = s.SupplierID
where UnitPrice > 50