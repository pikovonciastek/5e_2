-- 1. Wyświetl średnią, najwyższą i najniższą kaloryczność napojów. Zmień nazwy kolumn na (odpowiednio) srednia_kalorycznosc, maksymalna_kalorycznosc, minimalna_kalorycznosc.
select avg(kalorie) as srednia_kalorycznosc, min(kalorie) as minimalna_kalorycznosc, max(kalorie) as maksymalna_kalorycznosc from drinki_informacje;


-- 2. wyświetl średnią kaloryczność poszczególnych kolorów napojów. Zmień nazwę kolumny ze średnią na srednia_kalorycznosc. Dane posortuj według średniej kaloryczności.
select kolor, avg(kalorie) as srednia_kalorycznosc from drinki_informacje group by kolor;


-- 3. Wyświetl średnią cenę drinków z lodem i drinków bez lodu (w jednym zapytaniu). zmień nazwę kolumny srednia_cena.
select avg(cena) as srednia_cena, lod from drinki_informacje group by lod; 


-- 4. Wyświetl ilość napojów z poszczególnych kolorów. Zmodyfikuj zapytanie tak, aby były wyświetlane tylko te kolory, w których są co najmniej dwa drinki
 select kolor, count(*) from drinki_informacje group by kolor having count(*)>=2;


-- 5. Ile jest napojów w poszczególnych kolorach. Do zapytania wybierz tylko drinki z lodem. 
select kolor, count(*) from drinki_informacje where lod="T" group by kolor;


-- 6. Wyświetl średnią kaloryczność napojów z lodem i bez lodu (w jednym zapytaniu). - do zapytania wybierz tylko drinki rozpoczynające się literą S lub B. Posortuj według średniej kaloryczności.
select lod, avg(kalorie) from drinki_informacje WHERE nazwa LIKE "S%" or nazwa LIKE "B%" group by lod;


-- 7. Wyświetl maksymalną ilość węglowodanów w poszczególnych kolorach. Wyświetl tylko te wiersze, w których maksymalna ilość węglowodanów jest większa od 5. Dane posortuj malejąco według maksymalnej ilości kalorii. 
select kolor, max(weglowodany) from drinki_informacje group by kolor having max(weglowodany)>5 order by max(kalorie) desc;