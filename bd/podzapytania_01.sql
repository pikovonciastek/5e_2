use w3schools;

-- select
-- 1.  Wypisać nazwę wszystkich towarów, cenę i pole ze średnią cenę wszystkich towarów
select round(avg(price), 2) from products;
-- 2 . Wypisać nazwę towaru, cenę i różnicę między jego ceną a średnią ceną wszystkich towarów
select productName, price, round((select avg(price) from products), 2) as avg_price from products;

-- 3. wypisze nazwę towaru, cenę oraz ile razy jego cena jest większa od najmniejszej ceny wszystkich towarów (stosunek ceny do ceny minimalnej)
select productName, price, round(price / (select min(price) from products), 2) as price_ratio from products;

-- where
-- 4.  wybieramy te zamówienia, w których łączna ilość zamówionych produktów jest mniejsza od średniej ilości zamawianych produktów
select orderID, ProductName from order_details
join products on order_details.productID = products.productID
where quantity < (select avg(quantity) from order_details);

-- 5. zapytanie zwracające nazwę najtańszego towaru
select productName, price from products
where price = (select min(price) from products);

-- 6. zapytanie zwracające nazwy i ceny wszystkich produktów z kategorii Seafood o cenach niższych niż średnia cena produktów
select productname, price from products
where categoryID = (select categoryID from categories where categoryName = 'Seafood');

-- 7. wyświetl nazwę i cenę towarów, które zostały zamówione (kiedykolwiek) w ilości co najmniej 15 sztuk (Quantity )
select productname, price from products
where productID in (select productID from order_details where quantity >= 15);

-- 8. wyświetl nazwę i cenę towarów, które zawsze są zamawiane w ilości co najmniej 15 sztuk (Quantity ) (i były co najmniej raz zamówione)
select productname, price from products
where productID not in (select productID from order_details where quantity < 15);

-- 9. Wyświetl nazwiska i imiona klientów (Customer Name), którzy nie korzystali z firmy  Speedy Express
select customerName from customers
where customerID not in (select customerID from orders where shipperID = (select shipperID from shippers where ShipperName = 'Speedy Express'));

-- 10. Wszystkie informacje o klientach, mających tę samą wartość w polu CustomerName (może wpisanych przez pomyłkę?)
select customerName, contactName, address, city, postalCode, country from customers
where customerName in (select customerName from customers group by customerName having count(customerName) > 1);

-- update

-- 11 Podnieś o 10% ceny produktów z kategorii  "Confections"
update products
set price = price * 1.1
where categoryID = (select categoryID from categories where categoryName = 'Confections');


-- 12  Dla zamówień klientów z UK zmień spedytora na "United Package"
update orders
set shipperID = (select shipperID from shippers where ShipperName = 'United Package')
where customerID in (select customerID from customers where country = 'UK');



-- 13. Dodaj nowy produkt z kategorii Confections dostarczony przez Exotic Liquid 
update products
