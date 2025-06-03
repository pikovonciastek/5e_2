--  a) Ile osób posiada więcej niż jedno mieszkanie?
select count(distinct nazwisko) as liczba_osob from osoby;

-- b) Utwórz listę zawierającą identyfikatory mieszkań, w których średnio na osobę przypada mniej niż 6 m2.
select adres.id_mieszkania from adres
join osoby on adres.id_mieszkania = osoby.id_mieszkania
where adres.metraz / osoby.liczba_osob < 6;

-- c) Podaj nazwiska i imiona właścicieli mieszkań o powierzchni powyżej 90 m2 i zajmowanych tylko przez jedną osobę.
select nazwisko, imie from osoby
join adres on osoby.id_mieszkania = adres.id_mieszkania
where adres.metraz > 90 and osoby.liczba_osob = 1;


-- d) Podaj, ile jest kobiet, a ilu mężczyzn wśród właścicieli mieszkań (uwaga: jeżeli jedna osoba jest właścicielem więcej niż jednego mieszkania, to liczymy ją tylko raz). Możesz wykorzystać fakt, że w danych imiona wszystkich kobiet (i tylko kobiet) kończą się literą „a”.
