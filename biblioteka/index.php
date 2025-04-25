<?php 
$link = new mysqli('localhost', 'root', '', 'biblioteka_4e2');
$sql = "select imie, nazwisko from czytelnicy order by nazwisko asc";
$sql = "select tytul from ksiazki join kategorie on ksiazki.id_kategoria = kategorie.id where nazwa like 'dramat'";
$result = $link -> query($sql);
$readers = $result -> fetch_all(mode: 1);
$titles = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Czytelnicy</h2>
<?php
        foreach($readers as $reader){
            echo "<p>{$reader['imie']} <b>{$reader['nazwisko']}</p></b>";
        }

        foreach($titles as $title){
            echo "<li>{$title['tytul']}</li>";
        }
        ?>
</body>
</html>

<?php
$link -> close();
?>