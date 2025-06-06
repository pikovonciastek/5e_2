use komis;

-- 1. tabela auta, wyświetl dwa pierwsze znaki numeru rejestracji wielkimi literami
select substring(upper(tablica) from -7 for 2) from auta;

-- 2 Z tabeli Handlowcy wyświetl wszystkie identyfikatory mailowe do znaku @ (substring_index)
select substring_index(email, '@', 1) from handlowcy;

-- 3. Z tabeli Handlowcy wyświetl informacje o handlowcach w postaci: imie nazwisko, e-mail (CONCAT)
select concat(imie, ' ', nazwisko, ' ', email) from handlowcy;

-- 4. Wypisz inicjały wszystkich handlowców z tabeli Handlowcy z aliasem Inicjaly oraz ich imiona i nazwiska.
select concat(left(imie, 1), '.', left(nazwisko, 1)) as inicjaly from handlowcy;

-- 5.Z tabeli Producenci wypisz wszystkie nazwy producentów aut, które są długości 5 znaków. 
select nazwa from producenci where char_length(nazwa) = 5;