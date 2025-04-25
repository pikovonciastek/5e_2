-- Zapytanie 1: wybierające jedynie pola miesiac i rok z tabeli zadania dla zadania z datą 2020-07-01
select miesiac, rok
from zadania
where datazadania = "2020-07-01";
-- Zapytanie 2: wybierające jedynie pola dataZadania i wpis z tabeli zadania dla zadań, których miesiąc to lipiec 
select dataZadania, wpis
from zadania
where miesiac = "lipiec";
-- Zapytanie 3: wybierające jedynie pole miesiąc i wyświetlające je bez powtórzeń, z tabeli zadania dla miesięcy zaczynających się na literę „l” (l jak lew, lizak)
select DISTINCT miesiac
from zadania
where miesiac like 'l%';

-- Zapytanie 4: zmieniające pole wpis w tabeli zadania dla zadania z datą 2020-07-13, nowy wpis to „Wycieczka: jezioro”
insert into zadania(dataZadania, wpis, miesiac, rok)
values('2020-07-03', 'Wycieczka: jezioro', 'lipiec', '2020');