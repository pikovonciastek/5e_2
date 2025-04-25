<?php
$link = new mysqli('localhost', 'root', '', 'filmy_AS');
$sql = "SELECT tytul, Nazwisko FROM filmy INNER JOIN rezyserzy ON filmy.RezyserID = rezyserzy.IDrezyser";
$result = $link -> query($sql);
$movies = $result -> fetch_all(mode: 1);
$sql = "SELECT imie, nazwisko, count(IDfilm) as ilosc_filmow FROM rezyserzy LEFT JOIN filmy ON filmy.RezyserID = rezyserzy.IDrezyser GROUP BY IDrezyser";
$result = $link -> query($sql);
$directors = $result -> fetch_all(mode: 1);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filmy</title>
    <style>
        table {
            border: 1px solid;
            border-collapse: collapse;
        }
        td, th {
            border: 1px solid;
        }
    </style>
</head>
<body>
    <table>
        <?php
        echo "<tr>";
        foreach($movies as $movie){
            foreach($movie as $film){
                echo "<td>$film</td>";
            }
            echo "</tr>";
        }
        ?>
    </table>
    <br>
    <ul>
        <?php
        foreach($directors as $director){
            echo "<li>{$director['imie']} {$director['nazwisko']} {$director['ilosc_filmow']}</li><br>";
        }
        ?>
    </ul>

    <h3>Nowy reżyser</h3>
    <form action="filmy.php" method="post">
        <label for="imie">Wpisz imię</label>
        <input type="text" id="imie" name="imie"><br>
        <label for="nazwisko">Wpisz nazwisko</label>
        <input type="text" id="nazwisko" name="nazwisko"><br>
        <button type="submit">Dodaj</button>
    </form>
    
    <h3>Usuń film</h3>
    <form action="filmy.php" method="post">
        <label for="tytul">Wpisz tytuł filmu</label>
        <input type="text" name="tytul" id="tytul">
        <button type="submit">Usuń film</button>
    </form>

    <h3>Zmiana tytułu</h3>
    <form action="filmy.php" method="post">
        <label for="idFILM">Wpisz id filmu</label>
        <input type="number" name="idFILM" id="idFILM"><br>
        <label for="tytul">Wpisz stary tytuł filmu</label>
        <input type="text" name="oldtytul" id="oldtytul"><br>
        <label for="tytul">Wpisz nowy tytuł filmu</label>
        <input type="text" name="newtytul" id="newtytul"><br>
        <button type="submit">Zmień tytuł</button>
    </form>
</body>
</html>

<?php
$link -> close();
?>