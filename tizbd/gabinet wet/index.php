<?php
$link = new mysqli('localhost', 'root', '', 'gabinet_wet');
$sql = "select id, imie, wlasciciel from zwierzeta where rodzaj = 1";
$result = $link -> query($sql);
$dogs = $result -> fetch_all(1);

$sql = "select id, imie, wlasciciel from zwierzeta where rodzaj = 2";
$result = $link -> query($sql);
$cats = $result -> fetch_all(1);

$sql = "select imie, telefon, szczepienie, opis from zwierzeta";
$result = $link -> query($sql);
$infos = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weterynarz</title>
    <link rel="stylesheet" href="weterynarz.css">
</head>
<body>
    <header>
        <h1>Gabinet Weterynaryjny</h1>
    </header>

    <main>
    <section class="left">
        <h2>PSY</h2>
        <!-- Skrypt 1 -->
        <?php
            foreach ($dogs as $dog) {
                echo "{$dog['id']} {$dog['imie']} {$dog['wlasciciel']} <br>";
            }
        ?>


        <h2>KOTY</h2>
        <!-- skrypt 2-->
        <?php
            foreach ($cats as $cat) {
                echo "{$cat['id']} {$cat['imie']} {$cat['wlasciciel']} <br>";
            }
        ?>
    </section>

    <section class="mid">
        <h2>SZCZEGÓŁOWA INFORMACJA O ZWIERZĘTACH</h2>
        <!--skrypt 3-->
        <?php
        foreach ($infos as $info){
        echo "
        Pacjent: {$info['imie']} <br>
        Telefon właściciela: {$info['telefon']}, ostatnie szczepienie: {$info['szczepienie']}, informacje: {$info['opis']} <hr>";
        }
        ?>
    </section>

    <section class="right">
        <h2>WETERYNARZ</h2>
        <a href="logo.jpg"><img src="logo-mini.jpg"></a>
        <p>Krzystof Nowakowski, lekarz weterynarii</p>
        <h2>GODZINY PRZYJĘĆ</h2>
        <table>
            <tr>
                <th>Poniedziałek</td>
                <th>Wtorek</td>
            </tr>
            <tr>
                <td>15:00 - 19:00</td>
                <td>15:00 - 19:00</td>
            </tr>
        </table>
    </section>
    </main>


</body>
</html>

<?php
$link -> close();
?>