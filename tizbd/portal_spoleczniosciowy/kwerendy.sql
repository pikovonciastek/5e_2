use 5e_2_portal_spoleczniosciowy;
-- ‒ Zapytanie 1: wybierające jedynie pola imie, nazwisko, opis, zdjecie z tabeli osoby, dla wszystkich osób, których hobby ma id jest jedną z wartości: 1, 2, 6
select DISTINCT imie, nazwisko, opis, zdjecie from osoby where hobby_id in (1,2,6);

-- ‒ Zapytanie 2: wybierające jedynie pola id i nazwisko z tabeli osoby oraz odpowiadające im pole nazwa z tabeli hobby dla osób, które urodziły się po 2000 roku


-- ‒ Zapytanie 3: wybierające jedynie pola id i zdjecie z tabeli osoby dla osób, które mają na imię Monika. Kwerenda wybiera pierwsze 5 wierszy, należy jawnie wskazać liczbę wierszy


-- ‒ Zapytanie 4: tworzące tabelę o nazwie wpisy z następującymi polami:
-- ‒ id, klucz główny jawnie zapisany, typu całkowitego dodatniego, automatycznie inkrementowany, nie może przyjmować wartości pustych
-- ‒ wpis typu tekstowego 
-- ‒ uzytkownik_id typu całkowitego dodatniego, nie może przyjmować wartości pustych.
