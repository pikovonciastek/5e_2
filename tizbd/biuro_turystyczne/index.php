<?php
    $link = new mysqli('localhost', 'root', '', '5e_2_biuro_turystyczne');
    $sql = "select id, dataWyjazdu, cel, cena from wycieczki where dostepna = 1";
    $result = $link -> query($sql);
    $availables = $result -> fetch_all(1);
    $sql = "select nazwaPliku, podpis from zdjecia order by podpis DESC";
    $result = $link -> query($sql);
    $images = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wycieczki po Europie</title>
    <link rel="stylesheet" href="styl4.css">
</head>
<body>
    <header>
        <h1>BIURO TURYSTYCZNE</h1>
    </header>


    <main>
    <h3>Wycieczki, na które są wolne miejsca</h3>
    <!-- skrypt 1 -->
    <?php
        foreach($availables as $available){
            echo "<li>{$available['id']}. dnia {$available['dataWyjazdu']} jedziemy do {$available['cel']}, {$available['cena']}</li>";
        }
    ?>
    </main>


    <div class="flex">
        <section class="left">
            <h2>Betsellery</h2>
            <table>
                <tr>
                    <td>Wenecja</td>
                    <td>kwiecień</td>
                </tr>
                <tr>
                    <td>Londyn</td>
                    <td>lipiec</td>
                </tr>    
                </tr>
                <tr>
                    <td>Rzym</td>
                    <td>wrzesień</td>
                </tr>
            </table>
        </section>

        <section class="mid">
            <h2>Nasze zdjęcia</h2>
            <?php
                foreach($images as $image){
                    echo "<img src='{$image['nazwaPliku']}' alt='{$image['podpis']}'>";
                }
            ?>
        </section>

        <section class="right">
            <h2>Skontaktuj się</h2>
            <a href="mailto:turysta@wycieczki.pl">napisz do nas</a>
            <p>telefon: 111222333</p>
        </section>
    </div>

    <footer>
        <p>Stronę wykonał: 000000000000000</p>
    </footer>
</body>
</html>

<?php
$link -> close();
?>