-- 1. Dodaj nowy towar:   'cukierki' o id 78, dostarczany przez dostawcę o id 1  z kategorii o id 2  (słodycze), cena 15, jednostka (unit) 10 do tabeli "Products"
insert into products
values (78, 'cukierki', 1, 2, '10', 15);

-- 2. Dodaj nowego kuriera (shippers) - GPL, telefon 22 123 45 67
insert into shippers(ShipperName, Phone)
values ('GPL', '22 123 45 67');

-- 3. dopisz nowy towar: 'karty' o cenie 20. podaj tylko te dwa pola
insert into products(ProductName, Price)
values('karty', 20);

-- 4. zmień cenę produktu o nazwie karty na 10
update Products
set Price = 10
where ProductName='karty';

-- 5. zmień nazwisko pracownika (employees) o id 3 na 'Fuller' (employeeID, LastName)
update employees
set LastName='Fuller'
where employeeID = 3;

-- 6. zwiększ cenę wszystkich produktów o 10 (products, price)
update products
set price = price + 10;

-- 7. Zmniejsz cenę wszystkich produktów o 10%
update products
set price = price * 0.9;

-- 8. zwiększ cenę o 5% wszystkich produktów dostarczanych przez dostawcę o id 4 (supplierID)
update products
set price = price * 1.05
where supplierID = 4;

-- 9. zmień dostawcę produktów z kategorii 7 na dostawcę o id 3
update products
set supplierID = 3
where categoryID = 7;

-- 10. w zamówieniu 10248 zmień numer pracownika na 3, datę na 5 lipca 1996 i numer dostawcy na 2 
update orders
set employeeID = 3, OrderDate = 1996-07-05, supplierID = 2
where OrderID = 10248;

-- 11. Usuń klientów o nazwie na literę M
delete from customers
where CustomerName like 'M%';

-- 12. Usuń klientów z Meksyku
delete from customers
where Country like 'Mexico';
 
-- 13. Usuń produkty o cenie mniejszej niż 15
 delete from products
 where Price < 15;

-- 14. Zmień numer dostawcy produktu o id 2 na dostawcę o id 3
update products
set ShipperID = 3
where ShipperID = 2;
 
-- 15, Zmień osobę do kontaktów na siebie dla klienta o numerze 1
update customers
set ContactName = 'Aleksander Sagan'
where CustomerID = 1;
 
-- 16. Zmniejsz o 5% cenę wszystkich produktów dostarczanych przez dostawcę o numerze 7
update products
set price = price * 0.95
where ShipperID = 7;
 
-- 17. Zwiększ cenę produktów z kategorii 1 o 10%
 update products
 set Price = price * 1.1
 where categoryID = 1;

-- 18. Dodaj nową kategorię produktów
Insert into categories(CategoryName)
values('Fats and oils');

-- 19. Z tabeli Pracownicy (Employees) usuń pracownika o numerze 3 (EmployeeID). 
delete from Employees
where EmployeeID = 3;

-- 20. Dodaj jeszcze jednego dostawcę (tabela Shippers)
insert into Shippers(ShipperName)
values('DHL');

-- 21. Podnieś cenę Tofu do 30 (ProductName -nazwa produktu, Price - cena, tabela Products)
update products
set price = price + 30
where ProductName = 'Tofu';

-- 22. Podnieś o 10% cenę (Price) wszystkich produktów o nazwie (ProductName) zaczynającej się na literę C) (tabela Products)
update products
set price = price * 1.1
where ProductName like 'C%';

-- 23. Usuń z tabeli OrderDetails zamówienia o ID 10443 oraz 10440 (OrderID).
delete from OrderDetails
where OrderID = 10443 and Order = 10440;

-- 24. Zmień adres (Address), miasto (City) i kraj (Country) dostawcy o numerze 2  (SupplierID) na ul. Pocztową, Nakło, Polskę. (tabela Suppliers)
update suppliers
set Address = 'Pocztowa', City = 'Naklo', Country = 'Poland'
where SupplierID = 2;
