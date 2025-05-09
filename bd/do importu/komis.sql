
create table Producenci(id integer primary key, nazwa varchar(50), data_wpisu date, autor_wpisu varchar(20));

create table Modele(id integer primary key, producent integer  references Producenci(id), nazwa varchar(50), rocznik_pocz integer, rocznik_konc integer, data_wpisu date, autor_wpisu varchar(20));

create table Samochody(id integer primary key, model integer references Modele(id), rocznik integer, wartosc decimal, tablica varchar(8), przebieg integer, silnik varchar(2) CHECK (silnik IN ('B', 'D', 'BG')), data_wpisu date, autor_wpisu varchar(20));

create table Klienci(id integer primary key, nazwa varchar(50), adres varchar(50), data_wpisu date, autor_wpisu varchar(20));

create table Operacje(id integer primary key, rodzaj varchar(20), data_wpisu date, autor_wpisu varchar(20));

create table Rejestry(id integer primary key, operacja integer  references Operacje(id), klient integer  references Klienci(id), samochod integer  references Samochody(id), kwota decimal, data_wpisu date, autor_wpisu varchar(20));

create table Handlowcy(login varchar(10), imie varchar(15), nazwisko varchar(50), email varchar(30), data_wpisu date, autor_wpisu varchar(20));

create table Rezerwacje(id integer, klient integer references Klienci(id), samochod integer references Samochody(id), data_rez date, data_wpisu date, autor_wpisu varchar(20));

