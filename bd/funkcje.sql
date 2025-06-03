-- CONCAT
-- 1. Z tabeli Customers Wypisz w jednym polu Address, PostalCode, City jako Addres, oddzielone spacją
select
concat(Address, ' ', PostalCode, ' ', City) adres from Customers;

-- 2. Wypisz nazwy produktów i ich ceny. Każda cena powinna być poprzedzona znakiem $
select concat(productname,' ', '$', price) from products;

-- CONCAT_WS
-- 3. Z tabeli Suppliers Wypisz w jednym polu Address, PostalCode, City jako Addres, oddzielone spacją. Użyj funkcji CONCAT_WS
select concat_ws(' ', address, PostalCode, City) adres from suppliers;

-- SUBSTRING    SUBSTR   MID pozycja może być ujemna (liczymy wtedy od końca)
-- 4. Z nazwy produkt od trzeciego znaku dwa znaki
select substring('produkt' from 3 for 2); 

-- 5 Shippers, wyświetlamy sam numer kierunkowy
select substring(Phone from 2 for 3) kierunkowy from shippers;

-- 6. wyświetlamy przedostatni znak z Phone (pesel)

-- LEFT

-- 7. Wypisz 12 pierwszych znaków z nazwy każdego klienta
select left(CustomerName, 12) from customers;

-- 8. Wypisz pierwsze 7 znaków nazwy produktu i dodaj na końcu znaki ...
select concat(left(ProductName, 7), '...') from products;

-- REPLACE

-- REVERSE

-- CHAR_LENGTH długość w znakach

-- 9. Wypisz kraje, z których pochodzą dostawcy, a w osobnej kolumnie długość nazwy kraju 

-- 10. Ile najwięcej znaków mają nazwy klientów? Wypisz.

-- 11. Dodatkowo wypisz najdłuższą nazwę lub nazwy

-- LENGTH długość w bajtach

-- 12. Wypisz długości nazw produktów używając funkcji char_length i length. Czy jest jakaś różnica?

-- UPPER 

-- 13. Wypisz nazwy kategorii zapisane wielkimi literami

-- LOWER

-- 14. Wypisz nazwy produktów małymi literami

-- SUBSTRING_INDEX

-- 15. oddziel imie i nazwisko z pola  ContactName

-- FORMAT   pl_PL

-- 16. Wypisz ceny produktów zaokrąglone do jednego miejsca po przecinku

-- 17. Dla poszczególnych kategorii wypisz średnie ceny, zaokrąglone do jednego miejsca po przecinku. 

-- LOCATE (napis1, napis2) zwraca pozycję pierwszego wystąpienia napisu1 w napisie2 POSITION (napis1 IN napis2)

-- REPEAT (napis, ile) powtarza napis określoną ilość razy

-- REPLACE (napis, from_string), new_string)

-- INSERT ?

-- FIELD?