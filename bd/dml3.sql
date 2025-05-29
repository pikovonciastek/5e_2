
-- 1. Utwórz tabelę KatalogConfections zawierającą wszystkie dane o produktach z kategorii Confections
create table KatalogConfections as
select * from products 
where categoryid = 3;

-- 2. ze względu na nowy podatek podnieś cenę wszystkich artykułów kategorii Confections o 20% w tabeli Products
update products
set price = price * 1.2
where categoryid = 3;

-- 3. Zmień nazwę tabeli KatalogConfections na KatalogTaniejJuzBylo 
alter table katalogconfections
rename to KatalogTaniejJuzBylo;

-- 4. Skopiuj do tabeli KatalogTaniejJuzBylo wszystkie produkty z kategorii Beverages
insert into katalogtaniejjuzbylo
select * from products
where categoryid = 1;

-- 5. Do tabeli Archiwum przenieś dane z tabeli Orders dotyczące zamówień z 1996 roku (skopiuj - jeśli trzeba utwórz tabelę -i potem usuń)
create table archiwum as
select * from orders
where year(orderdate) = 1996;

-- 6. Utwórz tabelę  Archiwum_Kontrahentów z danymi: nazwa dostawcy lub nazwa klienta, osoba do kontaktu, miasto, kraj z Włoch
create table archiwum_kontrahentów (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_kontrahenta VARCHAR(255) NOT NULL,
    osoba_do_kontaktu VARCHAR(255),
    miasto VARCHAR(100),
    kraj VARCHAR(100) DEFAULT 'Włochy'
);

-- 7. Usuń klientów i dostawców z Włoch z tabel Customers i Suppliers
update orders
set customerid = null
where customerid in (select customerid from customers where country = 'Italy');
delete from customers
where country = 'Italy';

delete from products
where supplierid in (select supplierid from suppliers where country = 'Italy');
delete from suppliers
where country = 'Italy';

update order_details
set productID = null
where productID in (select productID from products inner join suppliers on products.supplierid = suppliers.supplierid where suppliers.country = 'Italy');

delete from products
where supplierid in (select supplierid from suppliers where country = 'Italy');

delete from suppliers
where country = 'Italy';

-- 8. Do tabeli Archiwum_Kontrahentów dodaj kontrahentów z Niemiec i Francji
insert into archiwum_kontrahentow
select SupplierName, ContactName, City, country from suppliers
where country in ('Germany', 'France');
union
select CustomerName, ContactName, City, country from customers
where country in ('Germany', 'France');
 
-- 9. Z tabeli Customers wybierz dane klientów z Niemiec i dodaj ich do tabeli Suppliers
insert into suppliers
select * from customers
where country = 'Germany';

-- 10. Utwórz tabelę Archiwum zawierającą wszystkie dane z tabeli Orders dotyczące zamówień z 1996 roku
create table archiwum as
select * from orders
where year(orderdate) = 1996;
 

-- 11. Usuń z tabeli Orders wszystkie zamówienia z 1996 roku
delete from orders
where year(orderdate) = 1996;

-- 12. Do tabeli Archiwum dodaj wszystkie dane dotyczące zamówień ze stycznia 1997 roku
insert into archiwum
select * from orders
where year(orderdate) = 1997 and month(orderdate) = 1;