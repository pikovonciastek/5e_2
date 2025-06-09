-- NOW()
-- 1. wyświetl aktualną datę i czas. 
select now();

-- DATE(), TIME() - tylko  data lub tylko czas ze typu datetime
-- 2. Wyświetl w jednej kolumnie aktualną datę, w drugiej aktualny czas (wykorzystaj funkcję now)
select date(now()), time(now());

-- CURDATE()
-- 3. Wyświetl bieżącą datę systemową
select curdate();


-- DATE_FORMAT(data, tekst_formatujący) %m  %d  %Y
-- 4. Wyświetl aktualną datę w formacie amerykańskim (miesiąc/dzień/rok)
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');


-- DATEDIFF(data1, data2) - różnica w dniach między datami
-- 5. Ile dni pozostało do końca roku szkolnego
SELECT DATEDIFF('2025-06-27', CURDATE());

-- DATE_ADD(data, INTERVAL n przedział_czasu) przedział_czasu to DAY, WEEK, MONTH, YEAR, n - ilość 
-- 6. Wyświetl dowolną datę, oraz datę dzień później, tydzień, miesiąc i rok
SELECT '2025-06-01', DATE_ADD('2025-06-01', INTERVAL 1 DAY), DATE_ADD('2025-06-01', INTERVAL 1 WEEK), DATE_ADD('2025-06-01', INTERVAL 1 MONTH), DATE_ADD('2025-06-01', INTERVAL 1 YEAR);

-- DATE_SUB(data, INTERVAL n przedział_czasu) przedział_czasu to DAY, WEEK, MONTH, YEAR, n - ilość 
-- 7. Wyświetl dowolną datę, oraz datę dzień wcześniej, tydzień, miesiąc i rok
SELECT '2025-06-01', DATE_SUB('2025-06-01', INTERVAL 1 DAY), DATE_sub('2025-06-01', INTERVAL 1 WEEK), DATE_sub('2025-06-01', INTERVAL 1 MONTH), DATE_sub('2025-06-01', INTERVAL 1 YEAR);


-- DAY(data) MONTH(data) QUARTER(data) YEAR(data) - wyciągają z daty dzień, miesiąc, kwartał i rok
-- 8. wyciągnij z dowolnej daty dzień, miesiac, kwartał, rok
SELECT DAY('2025-06-01') AS dzien, MONTH('2025-06-01') AS miesiac, QUARTER('2025-06-01') AS kwartal, YEAR('2025-06-01') AS rok;



-- WEEKDAY(data) wyświetla numer dnia tygodnia
-- 9. wyświetl numer aktualnego dnia tygodnia, czy tydzień zaczyna się od poniedziałku czy niedzieli?
SELECT WEEKDAY(CURDATE());