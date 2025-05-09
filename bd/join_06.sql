use join_06_4egr2;

-- 3. Które osoby figurujące w bazie jako czytelnicy, nie wypożyczyły ani razu choćby jednej książki? (tabele: Czytelnik, Wypożyczenia, pola w kwerendzie: Czytelnik_Imie, Czytelnik_Nazwisko, Data_wypozyczenia)
select Czytelnik_Imie, Czytelnik_Nazwisko, Data_wypozyczenia
from czytelnik
left join wypozyczenia on czytelnik.ID = wypozyczenia.czytelnik_ID
where Data_wypozyczenia is null;
-- 4. Kto nie ma kota? (Tabele: Ludzie, Koty, pola w kwerendzie: Imie, Nazwisko, Imie_kota, Rasa)
select imie, nazwisko, Imie_kota, Rasa
from koty
right join ludzie on koty.ID_wlasciciela=ludzie.ID
where rasa is null;

-- 5.Jak ma na imię kot bez właściciela?   (Tabele: Ludzie, Koty, pola w kwerendzie: Imie_kota oraz nie wyświetlane pole Nazwisko - tylko dla kryterium) 
select imie_kota
from koty
left join ludzie on koty.ID_wlasciciela=ludzie.ID
where nazwisko is null;
 

-- 6. Wyświetl informacje o uczniach, którzy nie mają ocen  (tabele: Uczniowie, Oceny, pola w kwerendzie: imie, nazwisko, ocena, data)
select imie, nazwisko, ocena, data
from uczniowie
LEFT JOIN oceny on uczniowie.iducznia = oceny.iducznia
where ocena is null;  

-- 7. Wyświetl informacje o przedmiotach, z których nie wystawiono żadnych ocen (tabele: Oceny, Przedmioty, pola w kwerendzie: Nazwa_przedmiotu, Nazwisko_nauczyciela, Data)
select Nazwa_przedmiotu, Nazwisko_nauczyciela, data
from Oceny
right join przedmioty on oceny.idprzedmiotu = przedmioty.idprzedmiotu;