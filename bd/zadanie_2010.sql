use zadanie_2010;

-- a) Podaj imię i wzrost najwyższego chłopca oraz imię i wzrost najwyższej dziewczynki. Uwaga: Jest tylko jeden taki chłopiec i tylko jedna taka dziewczynka.
(SELECT imie, wzrost FROM noworodki WHERE plec = 's' ORDER BY wzrost DESC LIMIT 1)
UNION
(SELECT imie, wzrost FROM noworodki WHERE plec = 'c' ORDER BY wzrost DESC LIMIT 1)
;


-- b) W którym dniu urodziło się najwięcej dzieci? Podaj datę i liczbę dzieci. Uwaga: Jest tylko jeden taki dzień.
SELECT data_urodzenia, COUNT(*) AS liczba_dzieci
FROM noworodki
GROUP BY data_urodzenia
ORDER BY liczba_dzieci DESC
LIMIT 1;

-- c) Podaj imiona kobiet w wieku poniżej 25 lat, które urodziły dzieci o wadze powyżej 4000 g.
select distinct matki.imie from matki
join noworodki on matki.id_matki = noworodki.id_matki
where noworodki.waga > 4000 and matki.wiek < 25;

-- d) Podaj imiona i daty urodzenia dziewczynek, które odziedziczyły imię po matce.
select noworodki.imie, data_urodzenia from noworodki 
join matki on noworodki.id_matki = matki.id_matki
where plec="c" and noworodki.imie = matki.imie;

-- e) W pliku noworodki.txt zapisane są informacje o narodzinach bliźniąt. Bliźnięta można rozpoznać po tej samej dacie urodzenia i tym samym identyfikatorze matki. Pamiętaj, że przykładowo Jacek i Agatka oraz Agatka i Jacek to ta sama para. Możesz założyć, że w danych nie ma żadnych trojaczków, czworaczków, itd. Podaj daty, w których urodziły się bliźnięta.
SELECT data_urodzenia
FROM noworodki
GROUP BY data_urodzenia, id_matki
HAVING COUNT(*) = 2;

-- f) Ile urodziło się  chłopców, a ile dziewczynek?
select plec, count(plec) from noworodki where plec="s"
union
select plec, count(plec) from noworodki where plec="c";

-- g) podaj najwyższą wagę chłopców i najwyższą dziewczynek.
select plec, max(waga) from noworodki where plec='s'
union
select plec, max(waga) from noworodki where plec='c';

