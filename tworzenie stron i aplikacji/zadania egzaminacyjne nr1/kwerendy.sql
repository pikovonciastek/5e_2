-- Zapytanie 1
SELECT nazwaPliku, podpis 
FROM zdjecia 
ORDER BY podpis ASC; 

-- Zapytanie 2
SELECT cel, datawyjazdu 
FROM zdjecia 
WHERE dostepne IS NULL; 

-- Zapytanie 3
SELECT cel, cena,
from wycieczki
join zdjecia on wycieczki.zdjecia_id = zdjecia.id
WHERE cena > 1300;
-- Zapytanie 4
DROP TABLE uzytkownik;