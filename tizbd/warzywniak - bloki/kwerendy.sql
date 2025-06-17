-- Zapytanie 1: wybierające jedynie pola nazwa, ilosc, opis, cena, zdjecie z tabeli Produkty, dla produktów, których pole Rodzaje_id przyjmuje jedną z wartości: 1, 2
select nazwa, ilosc, opis, cena, zdjecie from produkty where rodzaje_id in (1, 2);

-- Zapytanie 2: wybierające jedynie nazwę produktu z tabeli Produkty i odpowiadającą mu nazwę producenta z tabeli Producenci dla produktów, dla których ilość jest mniejsza od 10 oraz pole Rodzaje_id przyjmuje wartość 1
select produkty.nazwa as produkt, producenci.nazwa as producent from produkty
join producenci on produkty.producenci_id = producenci.id
where ilosc < 10 and rodzaje_id = 1; 

-- Zapytanie 3: tworzące użytkownika anna z hasłem @nna23
CREATE USER 'anna'@'localhost' IDENTIFIED BY '@nna23';

-- Zapytanie 4: wstawiające wiersz do tabeli Produkty według specyfikacji:
-- klucz główny nadany automatycznie
-- Rodzaje_id – id wiersza z nazwą owoce w tabeli Rodzaje
-- Producenci_id – id wiersza z nazwą warzywa-rolnik w tabeli Producenci
-- pozostałe dane: nazwa: owoc1, ilość: 10, opis: puste pole, cena: 9,99, zdjecie: owoce.jpg
INSERT INTO Produkty (Rodzaje_id, Producenci_id, nazwa, ilosc, opis, cena, zdjecie)
VALUES (
  (SELECT id FROM Rodzaje WHERE nazwa = 'owoce'),
  (SELECT id FROM Producenci WHERE nazwa = 'warzywa-rolnik'),
  'owoc1', 10, '', 9.99, 'owoce.jpg'
);