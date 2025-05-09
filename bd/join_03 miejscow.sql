use join_03_04_2;
-- Wyświetl nazwisko i imię oraz adres osób które:
-- płacą mniej niż 50;
select nazwisko, imie, adres, oplaty
from osoba
join dom 
    on dom.nrtel = osoba.nrtel
where oplaty < 50;
-- mieszkają w miejscowości o numerze 1, 2, 3;
select nazwisko, imie, adres, nrmiejscow
from osoba
join dom
    on dom.nrtel = osoba.nrtel
where nrmiejscow IN (1, 2, 3);
-- są głównymi abonentami;
select nazwisko, imie, adres, nrmiejscow
from osoba
join dom
    on dom.nrtel = osoba.nrtel
where czy_glowny = 'prawda';
-- Wyświetl nazwisko, imię i zawód osób, które:
-- płacą za telefon między 40 a 80;
select nazwisko, imie, zawod
from praca
join osoba
on praca.SYMBZATR = osoba.SYMBZATR
join dom
on dom.nrtel = osoba.nrtel
where oplaty between 40 and 80;
-- mieszkają w miejscowości, której nazwa zaczyna się na ' P' lub na 'K';
select nazwisko, imie, zawod
from praca
join osoba
on praca.SYMBZATR = osoba.SYMBZATR
join dom
on dom.nrtel = osoba.nrtel
join miejscow
on miejscow.nrmiejscow = dom.nrmiejscow
where nazwa like 'P%' or nazwa like 'K%';
-- w numerze telefonu występuje cyfra 3 na trzecim miejscu;
select nazwisko, imie, zawod
from praca
join osoba
on praca.SYMBZATR = osoba.SYMBZATR
where nrtel like '__3%';
-- Wyświetl nr telefonu, nazwisko, miejscowość adres i zawód osoby, która:
-- pracują w miejscu, gdzie w polu NAZWA znajduje się litera 'u';
select nrtel, nazwisko, miejscow, adres, zawod
from osoba
join praca
on praca.SYMBZATR = osoba.SYMBZATR
join miejscow
on miejscow.nrmiejscow = dom.nrmiejscow
where nazwa like '%u%';

-- mieszka w miejscowości, w której serwis prowadzi firma, której nazwa kończy się na 'A' (lub 'a') i w polu ADRES ma literę 'o';


-- pole SYMBZATR kończy się dużą lub małą literą 'm' lub 'k' ;
