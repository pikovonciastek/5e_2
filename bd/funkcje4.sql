-- 1. Wyświetl aktualną datę. 
select curdate();

-- 2. wyświetl bieżący czas 
select time(now());

-- 3, Ilu pracowników zatrudniono w poszczególnych miesiącach. MONTH(data)  (MONTHNAME)

SELECT MONTH(data_zatrudnienia), MONTHNAME(data_zatrudnienia), COUNT(*) AS liczba_pracownikow
FROM pracownicy
GROUP BY MONTH(data_zatrudnienia), MONTHNAME(data_zatrudnienia);


-- 4. Ile dni pracownicy byli zatrudnieni na poszczególnych stanowiskach (DATEDIFF(data1, data2) );  (historia_pracy)

SELECT stanowisko_id, DATEDIFF(koniec, poczatek) AS suma_dni FROM historia_pracy;

-- 5. Wyświetl datę zatrudnienia w formacie dzień-miesiąc-rok (DATE_FORMAT(data, format)

SELECT imie, nazwisko, DATE_FORMAT(data_zatrudnienia, '%d-%m-%Y') AS data_formatowana
FROM pracownicy;

-- 6. Pracownik o id 102 będzie pracował na stanowisku FI_MGR w dziale 20 od dzisiaj przez  miesiąc (DATE_ADD(data, interwał)


-- 7. Dodaj nowego pracownika, zatrudnionego dzisiaj (CURDATE())