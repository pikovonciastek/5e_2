-- Zapytanie 1: wybierające jedynie pola zespol1, zespol2, wynik, data_rozgrywki z tabeli rozgrywka dla rekordów o wartości pola zespol1 równej „EVG”
select zespol1, zespol2, wynik, data_rozgrywki from rozgrywka where zespol1 = 'EVG';

-- Zapytanie 2: wybierające jedynie pola imie i nazwisko z tabeli zawodnik dla zawodników, dla których przypisane jest id pozycji równe 3
select imie, nazwisko from zawodnik where pozycja_id = 3;

-- Zapytanie 3: wybierające jedynie pola id, nazwisko z tabeli zawodnik oraz nazwę pozycji z tabeli pozycja dla zawodników, którym przypisane jest id równe 1, 2 lub 3 
select zawodnik.id, nazwisko, pozycja.nazwa from pozycja 
join zawodnik on pozycja.id = zawodnik.pozycja_id
where zawodnik.id in (1, 2, 3);

-- Zapytanie 4: usuwające tabelę liga