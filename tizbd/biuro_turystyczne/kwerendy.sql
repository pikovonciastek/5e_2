use 5e_2_biuro_turystyczne;

-- – Zapytanie 1: wybierające jedynie pola id, dataWyjazdu, cel i cena z tabeli wycieczki dla dostępnych wycieczek
select id, dataWyjazdu, cel, cena from wycieczki where dostepna = 1;


-- – Zapytanie 2: wybierające jedynie pola nazwaPliku i podpis z tabeli zdjecia, sortując je malejąco według kolumny podpis 
select nazwaPliku, podpis from zdjecia order by podpis DESC;


-- – Zapytanie 3: wybierające jedynie cel i cenę wycieczki z tabeli wycieczki oraz odpowiadający im podpis z tabeli zdjecia dla wycieczek, których cena jest wyższa niż 1200 zł. Zapytanie wykorzystuje relację
select cel, cena, zdjecia.podpis from wycieczki join zdjecia on zdjecia.id = wycieczki.zdjecia_id where cena > 1200; 


-- – Zapytanie 4: dodające do tabeli wycieczki pole liczbaDni przyjmujące tylko liczby naturalne, pole powinno być wstawione po polu dataWyjazdu
alter table wycieczki 
add column liczbaDni int unsigned; 
after dataWyjazdu;