<?php
/*
$link - new mysqli('localhost', 'root', '', 'podroze');
$sql = "select nazwaPliku, podpis FROM zdjecia ORDER BY podpis ASC";
$result = $link -> query($sql);
$images -> $result fetch_all(1);

$sql = "";
$result = $link -> query($sql);
$trips -> $result fetch_all(1);
*/
$obrazy = [
    ['nazwaPliku' => '1.jpg', 'podpis' => 'Londyn'],
    ['nazwaPliku' => '2.jpg', 'podpis' => 'Wenecja'],
    ['nazwaPliku' => '3.jpg', 'podpis' => 'Berlin'],
    ['nazwaPliku' => '4.jpg', 'podpis' => 'Warszawa'],
    ['nazwaPliku' => '5.jpg', 'podpis' => 'Budapeszt'],
    ['nazwaPliku' => '6.jpg', 'podpis' => 'Paryż'],
    ['nazwaPliku' => '7.jpg', 'podpis' => 'Nowy Jork'],
    ['nazwaPliku' => '8.jpg', 'podpis' => 'Barcelona'],
    ['nazwaPliku' => '9.jpg', 'podpis' => 'Moskwa'],
];
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poznaj Europę</title>
    <link rel="stylesheet" href="styl9.css">
</head>
<body>
    <header>BIURO PODRÓŻY</header>
    <div class="lewoprawo">
        <h2>Promocje</h2>
        <table>
            <tr>
                <td>Warszawa</td>
                <td>od 600 zł</td>
            </tr>
            <tr>
                <td>Wenecja</td>
                <td>od 1200 zł</td>
            </tr>
            <tr>
                <td>Paryż</td>
                <td>od 1200 zł</td>
            </tr>
        </table>
    </div>
    <div class="srodek">
        <h2>W tym roku jedziemy do...</h2>
        <?php
        foreach($obrazy as $obraz){
            $nazwaPliku = htmlspecialchars($obraz['nazwaPliku']);
            $podpis = htmlspecialchars($obraz['podpis']);
            echo "<img src='$nazwaPliku' alt='$podpis' title='$podpis'/>";
        }
        ?>
    </div>
    <div class="lewoprawo">
        <h2>Kontakt</h2>
        <a href="mailto:biuro@wycieczki.pl">napisz do nas</a>
        <p>telefon: 444555666</p>
    </div>
    
    <div class="dane">
    <h3>W poprzednich latach byliśmy w...</h3>
    <ol>
        <!--Skrypt 2 ($trips)-->
        <?php
        /*
        
        */
        ?>
        <li>Pojechaliśmy do</li>
        <li>Pojechaliśmy do</li>
        <li>Pojechaliśmy do</li>
    </ol>
    
    
    </div>
    <footer>
        <p>Stronę wykonał: xxxxxx</p>
    </footer>
</body>
</html>

<?php
# $link - close();
?>