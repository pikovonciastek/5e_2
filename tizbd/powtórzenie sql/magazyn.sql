use 5_2_magazyn;

-- Utwórz tabele:

-- Magazyny

-- Kod  całkowity, klucz podstawowy
-- Lokalizacja tekst, nie puste
-- Pojemność całkowita, nie puste

create table magazyny (
    kod int primary key,
    Lokalizacja varchar(255) not null,
    pojemnosc int not null
);

-- Kontenery

-- Kod tekst o stałej długości 4 znaków, klucz podstawowy,
-- Zawartosc tekst
-- Wartosc rzeczywista, dwa miejsca po przecinku, cztery przed
-- Magazyn całkowita, nie pusta, pole klucza obcego (odwołuje się do pola kod w tabeli magazyny)
create table kontenery (
    kod char(4) primary key,
    zawartosc text,
    wartosc dec(6,2),
    magazyn int,
    foreign key(magazyn) references magazyny(kod)
);


-- 1. Wyświetl wszystkie dane o wszystkich magazynach (zrzut)
select * from magazyny;

-- 2. Wyświetl wszystkie kontenery o wartości większej niż $150.  (zrzut)
select * from kontenery where wartosc > 150;

-- 3. Co jest przechowywane w kontenerach? Wyświetl zawartość tak, aby dane się nie powtarzały.   (zrzut)
 select distinct zawartosc from kontenery;

-- 4. Wyświetl średnią wartość wszystkich kontenerów.   (zrzut)
select avg(wartosc) from kontenery;

-- 5. Wyświetl kody magazynów wraz ze średnią wartością zawartych w nich kontenerów.  (zrzut)
select kod, avg(wartosc) from kontenery group by kod;

-- 6. Wyświetl kody magazynów wraz ze średnią wartością zawartych w nich kontenerów, ale ogranicz się do tych, w których średnia wartość kontenerów jest większa niż 150.  (zrzut)
select kod, avg(wartosc) from kontenery group by kod having avg(wartosc) > 150;

-- 7. Wyświetl kod każdego kontenera, wraz z miastem, gdzie jest zlokalizowany (czyli lokalizacją magazynu)  (zrzut)
select kontenery.kod, magazyny.lokalizacja from kontenery join magazyny on kontenery.magazyn = magazyny.kod;

-- 8. Wyświetl  kody magazynów wraz z liczbą kontenerów w każdym z tych magazynów.  (zrzut)
select magazyny.kod, count(kontenery.kod) as "liczba kontenerow" from magazyny join kontenery on kontenery.magazyn = magazyny.kod group by kod;

-- 9. Rozwiń poprzednie zapytanie tak, aby w zestawieniu były wymienione również magazyny, w których nie ma kontenerów (powinna być wyświetlona liczba zero, a nie magazyn pominięty w tym zestawieniu)  (zrzut)
-- Wskazówka: wybierz kod magazynu z tabeli magazyny oraz policz kod z tabeli Kontenery; dane wybieraj z dwóch tabel połączonych połączeniem rozszerzającym (LEFT JOIN lub RIGHT JOIN), z rozszerzanej strony powinna być tabela Magazyny (wybieramy wszystkie magazyny, także te, w których nie ma kontenerów); grupowanie według kodu magazynu

select magazyny.kod, count(kontenery.kod) as "liczba kontenerow" 
from magazyny 
left join kontenery on kontenery.magazyn = magazyny.kod 
group by magazyny.kod;
 

-- 10.  Wyświetl kody wszystkich magazynów, które są przeładowane (magazyn jest przeładowany, jeśli liczba zawartych w nim kontenerów jest większa niż jego pojemność)  (zrzut)

-- np. wyświetl kody tych magazynów (z tabeli Magazyny), których pojemność jest mniejsza niż

-- (podzapytanie) ilość kontenerów (z tabeli kontenery), których kod magazynu (pole magazyn) jest taki jak kod magazynu z tabeli głównego zapytania (czyli Magazyny)

select kod from magazyny where pojemnosc < (select count(*) from kontenery where magazyn = magazyny.kod);

-- 11. Wyświetl kody wszystkich kontenerów zlokalizowanych w Chicago wraz z lokalizacją i pojemnością magazynów . Uwzględnij w zestawieniu także te magazyny z Chicago, w których nie ma aktualnie kontenerów  (zrzut)

select kontenery.kod from kontenery left join magazyny on kontenery.magazyn = magazyny.kod where lokalizacja = "Chicago";

-- lub zastosuj podzapytanie (wyświetl kody kontenerów, dla których kod magazynu (magazyn) jest na liście (IN) kodów magazynów zlokalizowanych w Chicago. 

-- 12. Utwórz nowy magazyn w Nowym Yorku z pojemnością 3 kontenerów.   (zrzut)

insert into magazyny(Lokalizacja, pojemnosc) values("New York", 3);

-- 13. Utwórz nowy kontener, z kodem "H5RT",  zawierającym "Papers" z wartością $200 i zlokalizowany w magazynie o kodzie 2.  (zrzut)

insert into kontenery(kod, zawartosc, wartosc, magazyn) values("H5RT", "Papers", 200, 2);

-- 14. Zmniejsz wartość wszystkich kontenerów o 15%.  (zrzut)
update kontenery
set wartosc = wartosc * 0.85;


-- 15 Usuń wszystkie kontenery o wartości mniejszej niż $100.  (zrzut)
delete from kontenery where wartosc < 100;


-- 16. Usuń wszystkie kontenery z przeładowanych magazynów.   (zrzut)
-- usuń wszystkie kontenery, których kod jest na liście (IN) kodów przeładowanych magazynów (tę wartość zwraca zapytanie nr. 10)

delete from kontenery where magazyn in (select kod from magazyny where pojemnosc < (select count(*) from kontenery where magazyn = magazyny.kod));