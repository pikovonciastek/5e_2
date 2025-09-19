use 5_2_kino;

-- 1. Przygotuj tabele:

-- Filmy
-- Kod liczba całkowita, autoinkrementacja, klucz podstawowy
-- Tytul  tekst
-- Rating tekst

create table Filmy(
    kod int auto_increment primary key,
    tytul varchar(255),
    rating varchar(255)
);



-- Kina
-- Kod  liczba całkowita, autonumerowanie, klucz podstawowy
-- Nazwa tekst nie puste
-- Film liczba całkowita, klucz obcy odwołujący się do pola kod w tabeli Filmy

create table Kina(
    kod int auto_increment primary key,
    nazwa varchar(255) not null,
    film int,
    foreign key(film) references filmy(kod)
);

 

--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(9,'Citizen King','G');
--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(1,'Citizen Kane','PG');
--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(2,'Singin'' in the Rain','G');
--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(3,'The Wizard of Oz','G');
--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(4,'The Quiet Man',NULL);
--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(5,'North by Northwest',NULL);
--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
--  INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(7,'Some Like it Hot','PG-13');
--  INSERT INTO Filmy(Kod,Tytul,Rating)  VALUES(8,'A Night at the Opera',NULL);
 
--  INSERT INTO Kina(Kod,Nazwa,Film) VALUES(1,'Odeon',5);
--  INSERT INTO Kina(Kod,Nazwa,Film) VALUES(2,'Imperial',1);
--  INSERT INTO Kina(Kod,Nazwa,Film) VALUES(3,'Majestic',NULL);
--  INSERT INTO Kina(Kod,Nazwa,Film) VALUES(4,'Royale',6);
--  INSERT INTO Kina(Kod,Nazwa,Film) VALUES(5,'Paraiso',3);
--  INSERT INTO Kina(Kod,Nazwa,Film) VALUES(6,'Nickelodeon',NULL);
 

 

 

 

-- 1. Wyświetl tytuły wszystkich filmów

select tytul from filmy;

-- 2. Ile różnych poziomów ratingu jest zapisane w bazie? Wyświetl je (dane nie powinny się powtarzać). 

select distinct rating from filmy;

-- 3. Wyświetl wszystkie filmy z nieustalonym ratingiem.

select * from filmy where rating is null;

-- 4. Wyświetl wszystkie  kina, w których aktualnie nie są wyświetlane żadne filmy. 

select * from kina where film is null;

-- 5. Wyświetl wszystkie dane o kinach i filmach, uwzględnij tylko dane o filmach, które są wyświetlane w tych kinach i dane o kinach, w których są wyświetlane jakieś filmy. 

select * from kina join filmy on kina.film = filmy.kod;

-- 6. Wyświetl wszystkie dane o kinach i filmach, uwzględnij w zestawieniu także te kina, w których aktualnie nie są wyświetlane żadne filmy.

select * from kina left join filmy on kina.film = filmy.kod;


-- 7. Wyświetl wszystkie dane o kinach i filmach, uwzględnij w zestawieniu także te filmy, które nie są aktualnie wyświetlane w żadnych kinach. 

select * from filmy left join kina on filmy.kod = kina.film;

-- 8. Wyświetl wszystkie dane o kinach i filmach, uwzględnij w zestawieniu także te kina, w których aktualnie nie są wyświetlane żadne filmy oraz  te filmy, które nie są aktualnie wyświetlane w żadnych kinach. 

SELECT * FROM kina LEFT JOIN filmy ON kina.film = filmy.kod
UNION
SELECT * FROM filmy LEFT JOIN kina ON filmy.kod = kina.film;



-- 9. Dodaj film  "One, Two, Three" (bez ratingu)

insert into film(tytul, rating)
values("One, Two, Three", NULL);
 
-- 10. Ustal rating wszystkich filmów bez ratingu na  "G".

update filmy
set rating = "G"
where rating is null;

-- 11. usuń kina wyświetlające filmy z ratingiem "NC-17".
delete kina from kina join filmy on kina.film = filmy.kod where rating = "NC-17";