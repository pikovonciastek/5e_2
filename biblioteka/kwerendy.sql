use biblioteka_4e2;
-- Zapytanie wybierające jedynie pola imie i nazwisko dla wszystkich rekordów w tabeli czytelnicy, posortowane rosnąco nazwiskami czytelników
select imie, nazwisko from czytelnicy order by nazwisko asc;

-- wybierające jedynie pole tytul dla wszystkich utworów w tabeli książki, należącej do kategorii dramat
select tytul from ksiazki join kategorie on ksiazki.id_kategoria = kategorie.id where nazwa like 'dramat';

-- wybierające jedynie pole tytul wszystkich utworów w tabeli ksiązki, wypożyczonych przez czytelnika o identyfikatorze 2. W zapytaniu należy posłużyć się relacją
select tytul from ksiazki join wypozyczenia ON ksiazki.id = wypozyczenia.id_czytelnik where id_czytelnik = 2;

-- wybierające jedynie pola imie i  nazwisko dla wszystkich rekordów w tabeli autorzy oraz obliczające liczbę tytułów danego autora znajdujących się w bazie biblioteka. Nazwa kolumny (alias) dla zliczania tytułów: ile_tytulow
select imie, nazwisko from autorzy desc join ksiazki on autorzy.id = ksiazki.id_autor;

