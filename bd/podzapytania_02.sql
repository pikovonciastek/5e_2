-- Podzapytanie wybierające wiele wartości
-- 1. Wybierz dane klientów, którzy nie kupili żadnego produktu z kategorii Confections
select customers.CustomerID, customers.CustomerName, customers.ContactName, customers.Address, customers.City, customers.Country, customers.Postalcode
from Customers
where customers.CustomerID not in (
    select distinct orders.CustomerID
    from Orders
    join Order_Details on orders.OrderID = order_details.OrderID
    join Products on order_details.ProductID = products.ProductID
    join Categories on products.CategoryID = categories.CategoryID
    where Categories.CategoryName not in ('Confections')
);
-- 2. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe.
select customerName, ContactName, address, City, Country from customers
where customerID not in (select customerID from orders where year(orderdate) = 1997);

-- 3. Wyświetl nazwiska i imiona pracowników, którzy nie sprzedali niczego do Argentyny.
select distinct employees.FirstName, employees.LastName
from Employees
where employees.EmployeeID not in (
    select distinct orders.EmployeeID
    from Orders
    join Customers on orders.CustomerID = customers.CustomerID
    where customers.Country = 'Argentina'
);

-- 4. Wypisz nazwy i kraje klientów, którzy zawsze zamawiali tylko jeden produkt.
select customers.CustomerName, customers.Country
from Customers
where customers.CustomerID in (
    select orders.CustomerID
    from Orders
    join Order_Details on orders.OrderID = order_details.OrderID
    group by orders.CustomerID, orders.OrderID
    having count(distinct order_details.ProductID) = 1
);
 
-- Podzapytania i zapytania DML
-- 1. Usuń wszystkich szczegóły zamówień (wiersze z OrderDetails) dotyczące produktu o nazwie "Chang"
delete from Order_Details
where ProductID in (
    select ProductID
    from Products
    where ProductName = 'Chang'
);

-- 2. Zwiększ o 10% ceny wszystkich produktów z kategorii "Confections"
update Products
set Price = Price * 1.10
where CategoryID in (
    select CategoryID
    from Categories
    where CategoryName = 'Confections'
);


-- 3. Zmniejsz o 5% ceny wszystkich produktów dostarczanych przez dostawców z  Tokyo  (city)
update Products
set Price = Price * 0.95
where SupplierID in (
    select SupplierID
    from Suppliers
    where City = 'Tokyo'
);

-- 4. Usuń wszystkie produkty z kategorii  o opisie "Cheeses" (Description)  o cenie większej od 50
delete from Products
where CategoryID in (
    select CategoryID
    from Categories
    where Description = 'Cheeses'
) and Price > 50;

-- 5. Zwiększ o 10% cenę wszystkich produktów z kategorii o nazwie zaczynającej się na literę C 
update products
set Price = Price * 1.10
where CategoryID in (
    select CategoryID
    from Categories
    where CategoryName like 'C%'
);

-- 6. Usuwamy wszystkie produkty dostarczane przez dostawców z USA
delete from Products
where SupplierID in (
    select SupplierID
    from Suppliers
    where Country = 'USA'
);

-- 7. Usuń wszystkie zamówienia z Orders złożone przez klientów z Londynu ('London').
delete from orders
where CustomerID in (
    select CustomerID from customers where City = 'london'
);
 
-- Podzapytania wybierające jedną wartość
-- 1. Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu danej kategorii 
select ProductName as Produkty
from Products p
where Price < (
    select avg(Price)
    from Products
    where CategoryID = p.CategoryID
);

-- 2. Dla każdego produktu podaj jego nazwę, cenę, średnią cenę wszystkich produktów oraz różnicę między ceną produktu a średnią ceną wszystkich produktów
select ProductName as Nazwa, (select avg(price) from products) as Sredna_Cena, Price - (select avg(price) from products) as roznica from products;
 
 
 
-- ------------------ NIETYPOWE ----------------------------------------------------------------------------
-- 1. Podaj produkty kupowane przez więcej niż 10 klientów (lub 10 różnych klientów - wsk. utwórz zapytanie wybierające różne wiersze CustomerID, ProductID z tabel Orders i OrdersDetalis i użyj jako podzapytanie w części FROM)

 
-- 2. Wybierz nazwy i numery telefonów klientów, którzy kupili więcej niż 3 różne produkty z kategorii .Confections.
select c.CustomerName, c.ContactName
from Customers c
where c.CustomerID in (
    select o.CustomerID
    from Orders o
    join Order_Details od on o.OrderID = od.OrderID
    join Products p on od.ProductID = p.ProductID
    join Categories cat on p.CategoryID = cat.CategoryID
    where cat.CategoryName = 'Confections'
    group by o.CustomerID
    having count(distinct p.ProductID) > 3
);

-- 3. Dla każdego produktu podaj maksymalną liczbę zamówionych jednostek
select distinct ProductName, max(quantity) from products 
join Order_Details on products.ProductID = Order_Details.ProductID
group by ProductName;


-- 4. Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, średnią cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu a średnią ceną wszystkich produktów danej kategorii.
select ProductName, CategoryName, round(Price), 
       round((select avg(Price) from Products where CategoryID = p.CategoryID)) as Srednia_Cena,
       Price - round((select avg(Price) from Products where CategoryID = p.CategoryID)) as roznica
       from Products p
join Categories c on p.CategoryID = c.CategoryID;


-- 5. Podaj łączną wartość zamówienia o numerze 1025 (uwzględnij cenę za przesyłkę). 
select sum(od.Quantity * p.Price) as laczna_Wartosc
from Orders o
join Order_Details od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where o.OrderID = 1025;

-- 6. Podaj łączną wartość zamówień każdego zamówienia (uwzględnij cenę za przesyłkę).
select o.OrderID, sum(od.Quantity * p.Price) as laczna_Wartosc
from Orders o
join Order_Details od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
group by o.OrderID;

-- 7. Podaj produkty kupowane przez więcej niż jednego klienta
select distinct p.ProductName
from Products p
join Order_Details od on p.ProductID = od.ProductID
join Orders o on od.OrderID = o.OrderID
join Customers c on o.CustomerID = c.CustomerID
group by p.ProductID
having count(distinct c.CustomerID) > 1;

-- 8. Podaj produkty kupowane przez więcej niż 20 klientów
select p.ProductName, count(c.CustomerID)
from Products p
join Order_Details od on p.ProductID = od.ProductID
join Orders o on od.OrderID = o.OrderID
join Customers c on o.CustomerID = c.CustomerID
group by p.ProductID
having count(distinct c.CustomerID) > 20;