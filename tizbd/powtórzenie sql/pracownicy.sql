use 5_2_pracownicy;

create table Dzialy (
    kod int primary key,
    nazwa varchar(255),
    budzet real
);

create table Pracownicy (
    ID int primary key,
    imie varchar(255) NOT NULL,
    nazwisko varchar(255) NOT NULL,
    dzial int,
    foreign key (dzial) references Dzialy(kod)
);

--  1. Wyświetl nazwiska wszystkich pracowników
select nazwisko from pracownicy;


-- 2. Wyświetl nazwiska wszystkich pracowników, ale tak, aby się nie powtarzały (DISTINCT) 
select distinct nazwisko from pracownicy;

-- 3. Wyświetl dane wszystkich pracowników o nazwisku  "Smith".   
select * from pracownicy where nazwisko = "Smith";
 

-- 4. Wyświetl wszystkie dane pracowników o nazwisku  "Smith" lub "Doe".
select * from pracownicy where nazwisko = "Smith" or nazwisko = "Doe";

-- 5. Wyświetl wszystkie dane o pracownikach, którzy pracują w dziale 14.
select * from pracownicy where dzial = 14;

-- 6. Wyświetl wszystkie dane o pracownikach z działu 37 i działu 77. 
select * from pracownicy where dzial = 37 or dzial = 77;

-- 7. Wyświetl wszystkie dane o pracownikach, których nazwisko zaczyna się na literę  "S".
select * from pracownicy where nazwisko like "S%";

-- 8. Wyświetl sumę budżetów wszystkich działów. 
select sum(budzet) from dzialy;
 

-- 9. Dla każdego działu wyświetl liczbę pracowników (tylko kod działu i liczbę pracowników) 
select dzialy.kod, count(id) from pracownicy join dzialy on dzialy.kod = pracownicy.dzial group by pracownicy.dzial;

-- 10. Wyświetl wszystkie dane o pracownikach, łącznie z danymi o działach, w których pracują. 
select * from pracownicy join dzialy on dzialy.kod = pracownicy.dzial;
 

-- 11. Wyświetl imię i nazwisko każdego pracownika razem z nazwą i budżetem działu, w którym pracownik pracuje. 
select pracownicy.imie, pracownicy.nazwisko, dzialy.kod, dzialy.budzet from pracownicy join dzialy on dzialy.kod = pracownicy.dzial;
 

-- 12. Wyświetl imiona i nazwiska pracowników, którzy pracują w działach o budżetach większych niż  $60,000 (czyli sześćdziesiąt tysięcy)
select imie, nazwisko from pracownicy join dzialy on dzialy.kod = pracownicy.dzial where budzet > 60000;

-- 13. Wyświetl działy z budżetem większym niż średni budżet wszystkich działów. 
select nazwa from dzialy where budzet > (select avg(budzet) from dzialy);
 

-- 14. Wyświetl nazwy działów z więcej niż dwoma pracownikami 
select nazwa from dzialy where (select count(id) from pracownicy) > 2;

-- 15. Wyświetl imiona i nazwiska pracowników, pracujących w działach (dziale) z najmniejszym budżetem.
select pracownicy.imie, pracownicy.nazwisko from pracownicy join dzialy on dzialy.kod = pracownicy.dzial where (select min(budzet));

-- 16. Dodaj nowy dział  "Quality Assurance" z budżetem $40,000 i kodem 10. 
insert into dzialy (nazwa, budzet, kod)
values ("Quality Assurance", 40000, 10);

-- 17. Dodaj pracownika "Mary Moore", pracującą w dziale o kodzie 10, z ID 847-21-9811.
insert into pracownicy(imie, nazwisko, dzial, id)
values("Mary", "Moore", 10, 847219811);

-- 18. Zmniejsz budżet wszystkich działów o 10%.
update dzialy
set budzet = budzet * 0.9;

-- 19. przenieś pracowników z działu Research  do działu IT  .
update pracownicy
set 

-- 20. Usuń wszystkich pracowników pracujących w dziale   IT.
delete from pracownicy where dzial = 14;

-- 21. Usuń wszystkich pracowników, którzy pracują w działach z budżetem większym bądź równym $60,000 (60 tysięcy)
delete from pracownicy  join dzialy on dzialy.kod = pracownicy.dzial where budzet

-- 22. Usuń wszystkich pracowników
