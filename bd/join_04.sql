use join_04_4egr2;

-- 1.  Wykonaj zapytania sql wyszukujące odpowiedzi na poniższe pytania:
-- A. Ile jest chętnych do przyjęcia do poszczególnych przedszkoli? Wyświetl nazwę przedszkola i ilość chętnych.
select nazwa_przedszkola, count(*) as 'liczba chetnych'
from przedszkola 
join dzieci
on przedszkola.Id_przedszkola = dzieci.Id_przedszkola
group by dzieci.Id_przedszkola;
-- B. Ilu jest chętnych do przyjęcia do poszczególnych przedszkoli, uwzględnij wyłącznie trzylatków
select nazwa_przedszkola, count(*) as 'liczba chetnych'
from przedszkola 
join dzieci
on przedszkola.Id_przedszkola = dzieci.Id_przedszkola
where wiek = 3
group by dzieci.Id_przedszkola;
-- C. Wyświetl imiona i nazwiska dzieci, które mają na liście preferencji przedszkole mające w nazwie "Zuch". 
select imie, nazwisko, nazwa_przedszkola
from przedszkola 
join dzieci
on przedszkola.Id_przedszkola = dzieci.Id_przedszkola
where nazwa_przedszkola like '%zuch%';
 
-- D. Wyświetl imiona i nazwiska dzieci, które chodzą do przedszkola o identyfikatorze 16, 14, 8,28, 27 . Użyj operatora IN.
select imie, nazwisko, nazwa_przedszkola, Id_przedszkola
from przedszkola
join dzieci
on przedszkola.Id_przedszkola = dzieci.Id_przedszkola
where przedszkola.Id_przedszkola IN (16, 14, 8, 28, 27);

-- E. Zmodyfikuj zapytanie z części D tak, aby zamiast numerów przedszkoli były wyświetlane ich nazwy.
select imie, nazwisko, nazwa_przedszkola
from przedszkola
join dzieci
on przedszkola.Id_przedszkola = dzieci.Id_przedszkola
where przedszkola.Id_przedszkola IN (16, 14, 8, 28, 27);
 
-- F. Policz, ilu jest kandydatów do poszczególnych przedszkoli (wystarczą identyfikatory, uwzględnij tylko chłopców. Dane uporządkuj malejąco według ilości chętnych. Wyświetl tylko te wiersze, w których  ta ilość jest większa od 15.
select id_przedszkola, count(*)
from dzieci
where plec like 'chlopiec'
group by id_przedszkola
having count(*) > 15
order by count(*) desc;

-- G. Policz, ilu jest chętnych do poszczególnych przedszkoli. Wyświetl nazwy przedszkoli i liczbę miejsc w przedszkolach. Czy są takie przedszkola, w których liczba chętnych jest różna od ilości miejsc? 
select nazwa_przedszkola, liczba_miejsc, count(*)
from dzieci
join przedszkola 
on dzieci.id_przedszkola = przedszkola.id_przedszkola
group by przedszkola.id_przedszkola
having count(*) != liczba_miejsc;

-- H. Utwórz uporządkowaną alfabetycznie według nazwisk, listę pięcioletnich dziewczynek, które są zapisane do przedszkola Smerf lub Stokrotka.
select imie, nazwisko, nazwa_przedszkola
from dzieci
join przedszkola 
on dzieci.id_przedszkola = przedszkola.id_przedszkola
where wiek=5 and plec = 'dziewczynka' and (nazwa_przedszkola like '%smerf%' or nazwa_przedszkola like '%stokrotka%')
order by nazwisko asc;

-- I.  Podaj nazwy czterech przedszkoli, które mają największą ilość chętnych (uporządkowane malejąco według ilości chętnych) 
select nazwa_przedszkola, count(*)
from dzieci
join przedszkola 
on dzieci.id_przedszkola = przedszkola.id_przedszkola
group by nazwa_przedszkola
order by count(*) desc
limit 4;