-- use w3schools;
-- 1. Tabela Order_Details. Wyświetl sumę wszystkich sprzedanych ilości (Quantity)
select sum(quantity) from Order_Details;

-- 2. Products. 
-- A.Wyświetl najpierw 23% podatek z ceny (price) oraz nazwę produktu (productname). 
select price * 0.23, productname from products;

-- B.Następnie wyświetl średni 23% podatek z cen wszystkich produktów
select avg(price) * 0.23 from products;

-- 3 Products. Zlicz ilość produktów.
select count(*) from products;

-- 4. Product. Pogrupuj produkty według CategoryID i oblicz dla każdej kategorii najwyższą i najniższą cenę. Dane posortuj malejąco według CategoryID
select CategoryID, min(price), max(price)
FROM products
GROUP BY CategoryID
ORDER BY CategoryID desc;

-- 5. Products
-- A. Wyświetl wszystkie towary sprzedawane w butelkach ( unit zawiera tekst  "bottle")
select productname, unit from products where unit like '%bottle%';

-- B. Pogrupuj według kategorii (CategoryID)  i policz ilość produktów w każdej kategorii. Do zapytania wybierz tylko produkty sprzedawane w butelkach.
select CategoryID, count(*) from products where unit like '%bottle%' group by CategoryID;

-- 6. Customers
-- A. Policz, ilu jest klientów w poszczególnych krajach. Dane posortuj malejąco według ilości klientów
select Country, count(*) from Customers group by Country order by count(*);

-- B.  Policz, ilu jest klientów w poszczególnych krajach. Dane posortuj malejąco według ilości klientów, wyświetl tylko te kraje, w których jest co najmniej 10 klientów
select Country, count(*) from Customers group by Country HAVING COUNT(*) >= 10 order by count(*) desc;

-- 7. Products
-- A. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę.
select SupplierID, max(price) from products group by supplierID;

-- B. Wyświetl supplierID, cenę oraz unit produktów sprzedawanych w paczkach (pole unit zawiera tekst 'pkg') 
select supplierID, price, unit from products where unit like '%pkg%';

-- C. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę, do zapytania wybierz tylko produkty sprzedawane w paczkach
select supplierID, max(price) from products where unit like '%pkg%' group by supplierID;

-- D. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę, do zapytania wybierz tylko produkty sprzedawane w paczkach, ale wyświetl tylko te wiersze, w których maksymalna cena jest większa od 50
select supplierID, max(price) from products where unit like '%pkg%' group by supplierID HAVING MAX(price) > 50;

-- 8. Order_Details
-- A. Dla poszczególnych produktów (productID) podaj średnią, minimalną oraz maksymalną ilość sprzedawaną w ramach zamówienia (quantity)
select productID, avg(quantity), min(quantity), max(quantity) from Order_Details group by productID;

-- B. z powyższego zestawienia wybierz tylko te wiersze, w których ta średnia ilość jest mniejsza od 20
select productID, avg(quantity), min(quantity), max(quantity) from Order_Details group by productID having avg(quantity) < 20;

-- 9. Customers
-- A z jakiego kraju jest najwięcej klientów
Select Country, count(*) from customers group by country order by count(*) desc limit 1;


-- B wymień trzy id kategorii z najdroższymi produktami (największa średnia)
select CategoryID, count(*) from 