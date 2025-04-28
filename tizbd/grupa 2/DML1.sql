-- 1. Do tabeli Handlowcy wprowadź dane z tabeli

-- imię	    nazwisko	email	    autor_wpisu	data_wpisu	login
-- Milan	Ogon	  milo@komis.pl	ibn	        2010-09-01	milo
-- Wojciech	Żak	      wojt@komi.eu	ibn	        2010-09-02	wojt
-- Piotr	Kupisz	  pik@komis.eu	ktc	        2015-02-20	pik
insert into Handlowcy 
(LOGIN, IMIE, NAZWISKO, DATA_WPISU, AUTOR_WPISU, EMAIL)
VALUES
('milo', 'Milan', 'Ogon', STR_TO_DATE('10/09/01', '%y/%m/%d'), 'ibn', 'milo@komis.pl');
insert into Handlowcy 
(LOGIN, IMIE, NAZWISKO, DATA_WPISU, AUTOR_WPISU, EMAIL)
values
('wojt', 'Wojciech', 'Żak', STR_TO_DATE('10/09/02', '%y/%m/%d'), 'ibn', 'wojt@komi.eu');
insert into Handlowcy 
(LOGIN, IMIE, NAZWISKO, DATA_WPISU, AUTOR_WPISU, EMAIL)
VALUES
('pik', 'Piotr', 'Kupisz', STR_TO_DATE('15/02/20', '%y/%m/%d'), 'ktc', 'pik@komis.eu');



-- 2. 
-- A. Jeśli w tabeli Handlowcy brak jest pola sektor- dodaj je (typ int)



-- B. Zaktualizuj (update) wartości kolumny sektor: dla loginów ibn, ktc ustaw sektor 1, dla milo oraz pik ustaw wartość pola sektor na 2, dla wojt na 3, a dla agam na 4



-- 3. Wyświetl całą zawartość tabeli handlowcy, a następnie zmodyfikuj wpisy:
-- A. poprawiając adres mailowy użytkownika milo na milo@komis.eu oraz 



-- B. usuń użytkownika z adresem mailowym pik@komis.eu
 

-- 4. Zmodyfikuj tabelę Rezerwacje 
-- A. Dodaj pole status (tekst do 20 znaków)




-- B. Zaktualizuj rekordy rezerwacji. Dla id = 1 nadaj status 'Oczekuje', dla id=2 nadaj status 'Anulowana'
 


-- 5.
-- A.  Utwórz tabelę Pracownicy i zaimportuj do niej dane z plikuzatrudnieni.csv (pierwszy wiersz zawiera nazwy pól)




-- B. W tabeli Pracownicy zaktualizuj dane pracownika o loginie skos w związku z jego przejściem do sektora handlowego - ustaw mu sektor 1. Przyjmij datę wpisu 2015-03-08 i autora wpisu ibn.