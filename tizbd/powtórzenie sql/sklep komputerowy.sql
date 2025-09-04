-- Utwórz tabele:

-- Producenci
--  kod całkowity, klucz podstawowy, autoinkrementacja
-- nazwa  tekst, pole nie może być puste


-- Produkty
-- kod całkowite, klucz podstawowy,  autoinkrementacja
-- nazwa tekst, pole nie może puste
-- cena dwa miejsca po przecinku, przed przecinkiem 5 cyfr
-- producent całkowite, klucz obcy odwołujący się do pola kod w tabeli producenci

use sklep_komputerowy;

create table Producenci(
    kod INT AUTO_INCREMENT PRIMARY KEY,
    nazwa varchar(255) NOT NULL
);

create table Produkty(
    kod INT AUTO_INCREMENT PRIMARY KEY,
    nazwa varchar(255) NOT NULL,
    cena DECIMAL(7,2),
    producent INT,
    FOREIGN KEY (producent) REFERENCES Producenci(kod) 
);

-- 1. Wyświetl nazwy wszystkich produktów|
select nazwa from Produkty;

-- 2. Wyświetl nazwy i ceny wszystkich produktów w sklepie 
select nazwa, cena from Produkty;

-- 3. Wyświetl nazwy produktów o cenie mniejszej lub równiej  $200.
select nazwa from Produkty where cena < 200;

-- 4. Wyświetl wszystkie produkty o cenie pomiędzy $60 i $120.
select nazwa from Produkty where cena between 60 AND 120;

-- 5. Wyświetl nazwy produktów i ceny w centach (tzn. pomnóż ceny przez 100) 
select nazwa, cena * 100 from Produkty;

-- 6. Wyświetl średnią cenę wszystkich produktów 
select avg(cena) from Produkty;

-- 7. Wyświetl średną ceną wszystkich produktów producenta o kodzie 2 
select avg(cena) from Produkty where kod = 2;

-- 8. Ile jest produktów o cenie większej lub równiej $180.
select COUNT(*) as Produkty from Produkty where cena >= 180;

-- 9. Wyświetl nazwy i ceny wszystkich produktów o cenie większej lub równej  $180, i posortuj je najpierw według ceny (rosnąco), a następnie według nazwy (malejąco) 
select nazwa, cena from Produkty where cena >= 180 ORDER BY cena, nazwa DESC;


-- 10. Wyświetl wszystkie dane z z tabeli produkty oraz wszystkie dane z tabeli producenci 
select * from Produkty join Producenci ON produkty.kod = Producenci.kod;

-- 11. Wyświetl nazwę produktu, cenę i nazwę producenta dla wszystkich produktów 
select produkty.nazwa, produkty.cena, producenci.nazwa as Producent from Produkty join Producenci on produkty.kod = Producenci.kod;

-- 12. Wyświetl średnią cenę produktów każdego producenta, pokazując tylko kod producenta
select producenci.kod, AVG(produkty.cena) from Produkty join Producenci on produkty.kod = Producenci.kod GROUP BY produkty.cena;

-- 13. Wyświetl średnią cenę produktów każdego producenta, pokazując nazwę producenta 

-- 14. Wyświetl nazwę każdego producenta, którego produkty mają średnią cenę większą lub równą $150

-- 15. Wyświetl nazwę i cenę najtańszego produktu  (LIMIT lub podzapytanie)

-- 16.Wyświetl nazwę każdego producenta razem z nazwą i ceną jego najdroższego produktu 

-- 17. Dodaj nowy produkt:  Loudspeakers, $70, producent 2.

-- 18. Zmień nazwę produktu o kodzie 8 na "Laser Printer".

-- 19. Wykonaj 10% przecenę każdego produktu 

-- 20. Wykonaj 10% przecenę każdego produktu o cenie większej lub równiej $120.