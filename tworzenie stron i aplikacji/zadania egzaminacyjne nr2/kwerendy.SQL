CREATE HODOWLA;
USE HODOWLA;
--IMPORT BAZA.SQL

--Zapytanie 1
select imie, miot from swinki where date is = "%-07-%";

--Zapytanie 2
select distinct miot, distinct date, rasy
from swinki
join rasy on rasy_id.swinki = id.rasy
where id is "1";

--Zapytanie 3
select imie, cena, opis
from swinki
where id is "1";

--Zapytanie 4
select rasa
from rasy;