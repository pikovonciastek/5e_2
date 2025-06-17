<?php
$link = new mysqli("localhost", "root", "", "warzywniak");

$nazwa = $_POST['produkt'] ?? null;
$cena = (float)$_POST['cena'] ?? null;
$sql2 = "INSERT INTO Produkty (Rodzaje_id, Producenci_id, nazwa, ilosc, opis, cena, zdjecie)VALUES ((SELECT id FROM Rodzaje WHERE nazwa = 'owoce'), (SELECT id FROM Producenci WHERE nazwa = 'warzywa-rolnik'), '$nazwa', 10, '', '$cena', 'owoce.jpg')";
$link -> query($sql2);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warzywniak</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <section id="baner-lewy">
        <h1>Internetowy sklep z eko-warzywami</h1>
    </section>
    <section id="baner-prawy">
        <ol>
            <li>warzywa</li>
            <li>owoce</li>
            <li><a href="https://terapiasokami.pl/" target="_blank">soki</a></li>
        </ol>
    </section>
    <section id="blok-glowny">
        <?php
        $sql = "select nazwa, ilosc, opis, cena, zdjecie from produkty where rodzaje_id in (1, 2)";
        $result = $link -> query($sql);
        while ($row = $result->fetch_assoc()) {
            echo "<div class='produkt'>";
            echo "<img src='{$row['zdjecie']}' alt='warzywniak'>";
            echo "<h5>{$row['nazwa']}</h5>";
            echo "<p>opis: {$row['opis']}</p>";
            echo "<p>na stanie: {$row['ilosc']}</p>";
            echo "<h2>{$row['cena']} zł</h2>";
            echo "</div>";
        }
        ?>
    </section>
    <footer>
        <form action="" method="post">
            <label for="produkt">Nazwa:</label>
            <input type="text" name="produkt" id="produkt">
            <label for="cena">cena:</label>
            <input type="number" name="cena" id="cena">
            <button>Dodaj produkt</button>

        </form>
        Stronę wykonał: 0000000000
    </footer>
</body>
</html>
<?php
$link -> close();
?>