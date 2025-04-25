SELECT tytul FROM Filmy WHERE gatunek='SF';

SELECT tytul, imie, nazwisko FROM filmy JOIN rezyserzy on filmy.rezyserid=rezyserzy.idrezyser;

SELECT * FROM filmy JOIN Recenzje on filmy.Recenzjaid=Recenzje.idRecenzja WHERE ocena=4;