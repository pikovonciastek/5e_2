-- 4. Wyświetl łączną liczbę miejsc we wszystkich przedszkolach
select sum(Liczba_miejsc) from przedszkola;
 
-- 5. Jaka jest średnia liczba miejsc we wszystkich przedszkolach? Zmień nazwę kolumny na srednia_liczba_miejsc
select avg(Liczba_miejsc) as srednia_liczba_miejsc from przedszkola;


-- 6. Jaka jest maksymalna i minimalna liczba miejsc w przedszkolach? Zmień nazwę kolumn na najmniejsza_liczba i najwieksza_liczba
select min(Liczba_miejsc) as najmniejsza_liczba, max(Liczba_miejsc) as najwieksza_liczba from przedszkola;
-- 7. Pogrupuj przedszkola według ilości miejsc, policz ile przedszkoli ma poszczególną liczbę miejsc. 
select Liczba_miejsc, COUNT(*) from przedszkola group by Liczba_miejsc;
 
-- 8. Zmodyfikuj powyższe zapytanie tak, aby były wyświetlone tylko te wiersze, w których liczba takich przedszkoli jest większa od dwóch.
SELECT Liczba_miejsc, COUNT(*) from przedszkola group by Liczba_miejsc HAVING COUNT(*) > 2;
 
-- 9.Jaka łączna liczba dzieci stara się o przyjęcie do przedszkoli?
select COUNT(*) from dzieci;
 
-- 10. Ile dzieci stara się do poszczególnych przedszkoli? (wyświetl Id_przedszkola oraz liczbę dzieci starających się o przyjęcie do tego przedszkola)
select Id_przedszkola, COUNT(*) from dzieci group by Id_przedszkola;
 
-- 11. Zmodyfikuj powyższe zapytanie tak, aby wyświetlane były tylko te wiersze, w których liczba starających się dzieci jest większa od 30
select Id_przedszkola, COUNT(*) from dzieci group by Id_przedszkola having COUNT(*)>30;
 
-- 12. Pogrupuj dane według wieku dzieci i wyświetl ile jest dzieci w poszczególnym wieku starających się o przyjęcie do przedszkola (wyświetl wiek dzieci oraz liczbę dzieci)
select wiek, count(*) from dzieci group by wiek;
 
-- 13. Zmodyfikuj powyższe zapytanie tak, aby wyświetliło tylko dane dotyczące chłopców.
select wiek, count(*) from dzieci where plec="chlopiec" group by wiek;
 
-- 14. Jaki jest średni wiek chłopców, a jaki średni wiek dziewczynek? (w jednym zapytaniu)
select plec, AVG(wiek) from dzieci group by plec;
 
-- 15. Ile małych dzieci stara się do poszczególnych przedszkoli (do zapytania wybierz tylko trzylatków i czterolatków)
select Id_przedszkola, count(*) from dzieci where wiek=3 or wiek=4 group by Id_przedszkola;