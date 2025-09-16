<?php
// $link - new mysqli('localhost', 'root', '', 'hodowla');
// $sql = "select rasa from rasy;";
// $result = $link -> query($sql);
// $script1 = $result -> fetch_all(1);

// $sql = "select distinct miot, distinct date, rasy
// from swinki
// join rasy on rasy_id.swinki = id.rasy
// where id is '1'";
// $result = $link -> query($sql);
// $script2 = $result -> fetch_all(1);

// $sql = "select imie, cena, opis
// from swinki
// where id is '1'";
// $result = $link -> query($sql);
// $script3 = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hodowla świnek morskich</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <header>
        <h1>Hodowla świnek morskich - zamów świnkowe maluszki</h1>
    </header>

    <div class="leftmenu">
        <a href="peruwianka.php">Rasa Peruwianka</a>
        <a href="american.php">Rasa American</a>
        <a href="crested.php">Rasa Crested</a>
    </div>

    <div class="right">
    <h3>Poznaj wszystke rasy świnek morskich</h3>
    Skrypt 1
    <ol><?php
    // foreach($script1 as $rasa){
    //     echo "<li>{$rasa}</li>";
    // }
    ?></ol>
    </div>

    <div class="left">
    <img src="peruwianka.jpg" alt="świnka morska rasy peruwianka">
    Skrypt 2
    <?php
    // foreach($script2 as $race){
    //     echo "<h2>Rasa: {$race['rasa']}</h2>
    //     <br><p>Data urodzenia: {$race['data_ur']}
    //     <br><p>Oznaczenie miotu: {$race['miot']}";
    // }
    ?>
    <hr>

    <h2>Świnki w tym miocie</h2>
    Skrypt 3
    <?php
    // foreach($script3 as $desc){
    //     echo "<h3>{$desc['imie']} - {$desc['cena']} zł</h3>
    //     <br>{$desc['opis']}";
    // }
    ?>
    </div>



    


    <footer>
        <p>Stronę wykonał: Najlepsi 😎</p>
    </footer>
</body>
</html>