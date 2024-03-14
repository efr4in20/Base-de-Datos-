--1 Selecciona el nombre del cliente, la fecha de la primera compra y la cantidad total 
--gastada por el cliente, solo para clientes que han gastado más de $1000 en total
--ordenados por la cantidad total gastada en orden descendente

Select c.CompanyName as 'Nombre del cliente',
min (o.OrderDate)as 'Fecha Primera compre',
sum (od.Quantity*od.UnitPrice) as 'Total de compras del cliente' 
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers 
as c  on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum (od.Quantity*od.UnitPrice) >1000
order by  'Total de compras del cliente'  desc

--2  Selecciona el nombre del producto, la cantidad en Stock y la cantidad total
--vendida pra productos que tienen almenos una venta, ordenados por nombre de producto

Select p.ProductName as 'Producto', p.UnitsInStock, sum (od.Quantity * od.UnitPrice) from 
Products as p
inner join [Order Details] as od
on od.ProductID = p.ProductID 
group by  p.ProductName, p.UnitsInStock
having COUNT (od.OrderID)>0
order by 2 desc 

--3 Selecciona el nombre del empleado y la cantidad total de productos que han vendido cada empleado
-- solo para empleados que han vendido más de 50 productos en total.
--Examen
Select concat (e.FirstName,' ', e.LastName) as 'Nombre', Count(distinct od.ProductID) as 'Total '
from  [Order Details] as od
inner join Products as p 
on od.ProductID = p.ProductID
inner join Orders as o 
on o.OrderID = od.OrderID
inner join Employees as e
on e.EmployeeID = o.EmployeeID
group by concat (e.FirstName,' ', e.LastName)
having count(o.OrderID)>50

--Seleccionar el total de ordenes realiszdas  por los
--empleado, mostrar solamente los que han vendido mas de 50
--orden
Select concat (e.FirstName,' ', e.LastName) as 'Nombre', Count(*) as 'Total 'from  [Order Details] as od
inner join Products as p 
on od.ProductID = p.ProductID
inner join Orders as o 
on o.OrderID = od.OrderID
inner join Employees as e
on e.EmployeeID = o.EmployeeID
group by concat (e.FirstName,' ', e.LastName)
having count(o.OrderID)>50

-----
select count (distinct od.ProductID) as 'Total'from
Orders as o inner join Employees as e
on e.EmployeeID = o.EmployeeID 
inner join [Order Details] as od 
on od.OrderID = o.OrderID 
where concat (e.FirstName, ' ', e.LastName) = 'Andrew Fuller'

--4 Selecciona los productos que han sido ordenados almenos una vez y muetra la cantidad total
--de veces que han sido ordenados, ordenados por la cantidad total de veces ordenadas en orden descendente
Select p.ProductName, count (od.ProductID)from [Order Details] 
as od
right join Products as p on od.ProductID = P.ProductID
group by p.ProductName
having count (od.ProductID) >=1
Order by 2 desc

--5 Obtiene el nombre del cliente y la cantidad total gastada por cada cliente
--en el año de 1996, solo para clientes que han gastado más de $500 en ese año
-- ordenado por la cantidad total fastada en orden descendente.

Select concat (e.FirstName,' ', e.LastName) as 'Nombre', 
sum (od.UnitPrice*od.Quantity ) as 'Total '
from Orders as o inner join Employees as e
on e.EmployeeID = o.EmployeeID 
inner join [Order Details] as od
on od.OrderID = o.OrderID 
where Year (o.OrderDate) = '1996'
group by concat (e.FirstName,' ', e.LastName)
order by 2 desc
