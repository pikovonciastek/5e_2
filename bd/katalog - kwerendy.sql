-- baza danych katalog
-- 1. Utwórz nową bazę danych. 
-- Przeimportuj do niej dane z arkusza 
-- Obliczenia dla wszystkich rekordów
-- 2. Policz ile jest pozycji w katalogu.
select count(*) from katalog;

-- 3. Jaki jest średni rok wydania płyty.
select avg(rok) from katalog;

-- 4. Z którego roku najwcześniej pochodzą płyty.
select min(rok) from katalog;

-- Obliczenia w grupach rekordów
-- 5. Zapisz kwerendę podającą ile jest płyt poszczególnych wykonawców.
select zespol, count(*) from katalog group by zespol;

-- 6. Zapisz kwerendę podającą ile jest płyt z poszczególnych lat.
select rok, count(*) from katalog group by rok;

-- 7. Zapisz kwerendę podającą dla poszczególnych wykonawców rok wydania pierwszej (najwcześniejszej płyty).
select zespol, min(rok) from katalog group by zespol;

-- Określenie kryterium (najpierw obliczanie potem kryterium)
-- 8. Zapisz kwerendę podającą wykonawców (wraz z ilością płyt), którzy mają więcej niż 4 płyty, posortowanych malejąco według nazwy wykonawców
select zespol, count(*) from katalog GROUP BY zespol HAVING count(*)>4 ORDER BY zespol desc;

-- 9. Zapisz kwerendę podającą wykonawców, którzy swoje pierwsze płyty wydali w roku 1969 lub 1977.
select zespol, min(rok) from katalog group by zespol HAVING min(rok)=1969 or min(rok)=1977;

-- Określenie kryterium (najpierw kryteria, potem obliczanie)
-- 10. Utwórz kwerendę podającą ile płyt poszczególni wykonawcy wydali w latach 70 –tych (80-tych). 
select zespol, count(*) from katalog where rok between 1970 AND 1979 group by zespol;

-- 11. Utwórz kwerendę podającą ile kilku płytowych albumów wydali poszczególni wykonawcy (tytuły zawierające „Disc ” lub „disc ” lub „vol. „).
select zespol, count(*) from katalog where tytul like "%Disc%" or tytul like "%vol%" group by zespol;
 

-- trzy zespoły, które mają najwięcej wydanych płyt
select zespol, count(*) from katalog group by zespol order by count(*) desc limit 3;


-- kwerenda to inna nazwa na zapytanie, obecna np. na egzaminie praktycznym inf.03