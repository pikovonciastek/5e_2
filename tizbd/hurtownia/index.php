<?php
    $link = new mysqli("localhost", "root", "", "hurtownia");
    $sql = "select klienci.zdjecie, klienci.imie, opinie.opinia from klienci join opinie on klienci.id = opinie.klienci_id where klienci.typy_id in (2,3)";
    $result = $link -> query($sql);
    $opinions = $result -> fetch_all(1);

    $sql = "select imie, nazwisko, punkty from klienci order by punkty desc limit 3";
    $result = $link -> query($sql);
    $customers = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Opinie klientów</title>
    <link rel="stylesheet" href="styl3.css">
</head>
<body>
    <header>
        <h1>Hurtownia spożywcza</h1>
    </header>

    <main>
        <h2>Opinie naszych klientów</h2>
        <?php
            foreach($opinions as $opinion){
                echo 
                "
                <section class='opinion'>
                <img src='{$opinion['zdjecie']}' alt='klient'>
                <blockquote>{$opinion['opinia']}</blockquote>
                <h4>{$opinion['imie']}</h4>
                </section>
                ";
            }
        ?>
    </main>

    <footer>
        <section>
        <h3>Współpracują z nami</h3>
        <a href="http://sklep.pl">Sklep 1</a>
        </section>

        <section>
            <h3>Nasi top klienci</h3>
            <ol>
                <?php
                    foreach($customers as $customer){
                        echo "<li>{$customer['imie']} {$customer['nazwisko']}, {$customer['punkty']} pkt. </li>";
                    }
                ?>
            </ol>
        </section>

        <section>
            <h3>Skontaktuj się</h3>
            <p>telefon: 111222333</p>
        </section>

        <section>
            <h3>Autor: 00000000000000</h3>
        </section>
    </footer>
</body>
</html>