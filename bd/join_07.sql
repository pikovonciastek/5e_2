use join_07_4egr2;

-- 1. Biblioteka potrzebuje informacji o wypożyczeniach książek. Proszę podać autorów, tytuły książek i oraz daty ich wypożyczeń. 

select Autor_imie, autor_nazwisko, tytul, data_wypozyczenia
from ksiazka
join wypozyczenia on ksiazka.sygnatura = wypozyczenia.ksiazka_sygnatura;

-- 2. Dodaj nową książkę, aby mieć pewność, że są takie, które nigdy nie były wypożyczone. Wyświetl książki, które nigdy nie zostały wypożyczone.

insert into ksiazka (sygnatura, tytul, autor_nazwisko) values (52100, 'PDW', 'Kurczynski');

select autor_nazwisko, tytul
from ksiazka
left join wypozyczenia on ksiazka.sygnatura = wypozyczenia.ksiazka_sygnatura
where data_wypozyczenia is null;

-- 3. Utwórz zestawienie pokazujące ile razy zostały wypożyczone książki (tytuł, autor, ilość wypożyczeń). W zestawieniu uwzględnij także te książki, które nigdy nie były wypożyczone.

select tytul, autor_nazwisko, count(ksiazka_sygnatura) as "ilosc wypozyczen"
from ksiazka 
left join wypozyczenia on ksiazka.sygnatura = wypozyczenia.ksiazka_sygnatura
group by ksiazka.sygnatura;

-- 4. Które osoby figurujące w bazie jako czytelnicy, nie wypożyczyły ani razu choćby jednej książki?

select czytelnik_nazwisko
from czytelnik
left join wypozyczenia on czytelnik.ID = wypozyczenia.czytelnik_ID
where data_wypozyczenia is null;

-- 5.  Jacy czytelnicy nie są przypisani do żadnego wydziału

select czytelnik_nazwisko
from czytelnik
left join wydzial on czytelnik.wydzial = wydzial.ID
where wydzial.wydzial is null;

-- 6. Wyświetl ranking czytelników pokazujący wszystkich z informacja, ile razy wypożyczyli cokolwiek (lista ma zawierać wszystkich czytelników – nawet tych, którzy nic nie wypożyczyli)
select 