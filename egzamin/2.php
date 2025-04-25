<?php
$link = new mysqli('localhost', 'root', '', 'filmoteka_4e2');
$sql = "SELECT tytul FROM Filmy WHERE gatunek='SF'";
$sql = "SELECT tytul, imie, nazwisko FROM filmy JOIN rezyserzy on filmy.rezyserid=rezyserzy.idrezyser;";
$result = $link -> query($sql);
$result = $link -> query($sql);
$movies = $result -> fetch_all(mode: 1);
$autors = $result -> fetch_all(mode: 1);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filmy</title>
</head>
<body>
    <h2>Filmy SF</h2>
    <ol>
        <?php
        foreach($movies as $movie){
            echo "<li> {$movie['tytul']} </li>";
        }
        ?>
    </ol>
    
    <h2>Twórcy filmów</h2>
    <ul>
        <li><strong>matrix</strong> Andy Wachowski</li>
    </ul>
 
</body>
</html>
<?php
    $link -> close();
?>