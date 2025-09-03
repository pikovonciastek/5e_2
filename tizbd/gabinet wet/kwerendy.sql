-- - Zapytanie 1: wybierające jedynie pola imie, telefon, szczepienie, opis z tabeli Zwierzeta
select imie, telefon, szczepienie, opis from zwierzeta;

-- - Zapytanie 2: wybierające jedynie pola id, imie, wlasciciel z tabeli Zwierzeta dla tych rekordów, dla których rodzaj to pies
select id, imie, wlasciciel from zwierzeta where rodzaj = 1;

-- - Zapytanie 3: korzystające z relacji i wybierające jedynie pola imie z tabeli Zwierzeta oraz odpowiadające im pola nazwa z tabeli Uslugi
select zwierzeta.imie, uslugi.nazwa
from zwierzeta 
join uslugi on zwierzeta.usluga_id = uslugi.id;

-- - Zapytanie 4: zwracające średnią cenę wszystkich usług zapisanych w tabeli Uslugi
Select AVG(cena) from uslugi;