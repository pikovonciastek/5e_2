use zadanie_2010;

-- a) Podaj imię i wzrost najwyższego chłopca oraz imię i wzrost najwyższej dziewczynki. Uwaga: Jest tylko jeden taki chłopiec i tylko jedna taka dziewczynka.
select max(wzrost) from noworodki where plec="s"
union
select max(wzrost) from noworodki where plec="c";

-- b) W którym dniu urodziło się najwięcej dzieci? Podaj datę i liczbę dzieci. Uwaga: Jest tylko jeden taki dzień.
select data_urodzenia, count(plec) from noworodki where ;

-- c) Podaj imiona kobiet w wieku poniżej 25 lat, które urodziły dzieci o wadze powyżej 4000 g.


-- d) Podaj imiona i daty urodzenia dziewczynek, które odziedziczyły imię po matce.
select imie, data_urodzenia from noworodki where plec="c" and imie=

-- e) W pliku noworodki.txt zapisane są informacje o narodzinach bliźniąt. Bliźnięta można rozpoznać po tej samej dacie urodzenia i tym samym identyfikatorze matki. Pamiętaj, że przykładowo Jacek i Agatka oraz Agatka i Jacek to ta sama para. Możesz założyć, że w danych nie ma żadnych trojaczków, czworaczków, itd. Podaj daty, w których urodziły się bliźnięta.


-- f) Ile urodziło się  chłopców, a ile dziewczynek?
select count(plec) from noworodki where plec="s"
union
select count(plec) from noworodki where plec="c";

-- g) podaj najwyższą wagę chłopców i najwyższą dziewczynek.