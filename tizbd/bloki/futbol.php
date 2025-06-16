<?php
$link = new mysqli('localhost', 'root', '', '4e_2_pilka');
$sql = "select zespol1, zespol2, wynik, data_rozgrywki from rozgrywka where zespol1 = 'EVG'";
$result = $link->query($sql);

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Światowe Rozgrywki Piłkarskie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<section class="baner">
    <h2>Światowe rozgrywki piłkarskie</h2>
    <img src="obraz1.jpg" alt="boisko">
</section>


<section class="kontener">
<?php
while ($row = $result->fetch_assoc()) {
    echo "<div class='rozgrywka'>";
    echo "<p>{$row['zespol1']} - {$row['zespol2']}</p>";
    echo "<p>{$row['wynik']}</p>"; 
    echo "<p>{$row['data_rozgrywki']}</p>";
    echo "</div>";
}
?>
</section>

<section class="glowny">
    <h2>Reprezentacja Polski</h2>
</section>

<section class="lewy">
    <p>Podaj pozycję zawodników (1-bramkarze, 2-obrońcy, 3-pomocnicy, 4-napastnicy):</p>
    <form method="POST" action="">
        <input type="number" name="pozycja" min="1" max="4" required>
        <button type="submit">Sprawdź</button>
    </form>

    <ul>
    <?php
    if (isset($_POST['pozycja']) != '') {
        $pozycja = intval($_POST['pozycja']);

        $sql2 = "SELECT imie, nazwisko FROM zawodnik WHERE pozycja_id = $pozycja";
        $result2 = $link->query($sql2);

        if ($result2 && $result2->num_rows > 0) {
            while ($row = $result2->fetch_assoc()) {
                echo "<li><p>{$row['imie']} {$row['nazwisko']}</p></li>";
            }
        }
    }
    ?>
    </ul>
</section>

<section class="prawy">
    <img src="zad1.png" alt="piłkarz">
    <p>Autor: 0000000000</p>
</section>

</body>
</html>
<?php
$link->close();
?>
