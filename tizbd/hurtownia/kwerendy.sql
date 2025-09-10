-- ‒ Zapytanie 1: wybierające z tabeli Klienci posortowane malejąco według punktów jedynie imię, nazwisko i punkty trzech klientów, których liczba punktów jest najwyższa
select imie, nazwisko, punkty from klienci order by punkty desc limit 3;

-- ‒ Zapytanie 2: wybierające nazwę z tabeli Typy oraz liczbę klientów przypisanych do każdego typu. Należy posłużyć się relacją
select typy.nazwa, COUNT(*) from typy join klienci on typy.id = klienci.typy_id order by typy.nazwa;

-- ‒ Zapytanie 3: wybierające jedynie pola zdjecie, imie z tabeli Klienci oraz odpowiadające im pole opinia z tabeli opinie dla klientów, których typ ma id o wartościach 2, 3. Należy posłużyć się relacją
select klienci.zdjecie, klienci.imie, opinie.opinia from klienci join opinie on klienci.id = opinie.klienci_id where klienci.typy_id in (2,3);

-- ‒ Zapytanie 4: dodające do tabeli Klienci kolumnę o nazwie adres i typie napisowym, maksymalnie 50-znakowym
alter table klienci
add column adres varchar(50);