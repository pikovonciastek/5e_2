<?php
$link = new mysqli("localhost", "root", "", "filmy_bloki");
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video on Demand</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <section class="Baner_left">
            <h1>Internetowa Wypożyczalnia filmów</h1>
        </section>
        <section class="Baner_right">
            <table>
                <tr>
                    <td>Kryminał</td>
                    <td>Horror</td>
                    <td>Przygodowy</td>
                </tr>
                <tr>
                    <td>20</td>
                    <td>30</td>
                    <td>20</td>
                </tr>
            </table>
        </section>

    </header>

    <main>
        <section class="lists">
            <h3>Polecamy</h3>
            
            <?php
            $sql = "select id, nazwa, opis, zdjecie from produkty where id in (18, 22, 23, 25)";
            $result = $link -> query($sql);
            $Recommended = $result -> fetch_all(1);

            foreach($Recommended as $Recom){
                echo "<section class='films'>";
                echo "<h4>{$Recom['id']}. {$Recom['nazwa']}</h4>";
                echo "<img src='{$Recom['zdjecie']}' alt='film'>";
                echo "</section>";
            }
            ?>
            
        </section>
        <section class="lists">
            <h3>Filmy fantastyczne</h3>
            <?php

            ?>
        </section>
    </main>

    <footer>
        <form action="" method="post">
            <label for="nr_filmu">Usuń film nr.</label>
            <input type="number" name="nr_filmu" id="nr_filmu">
            <button type="submit">Usuń film</button>
        </form>
        <p>Stronę wykonał: 000000000000</p>
    </footer>
</body>
</html>