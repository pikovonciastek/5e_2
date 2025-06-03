<?php
$link = new mysqli ("localhost", "root", "", "w3schools");
$sql = "select * from products";
$result = $link -> query($sql);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <label for="supplier">Wybierz dostawcę</label>
        <select name="supplier" id="supplier">

        </select>
        <br>
        <label for="product">Wpisz nazwę towaru</label>
        <input type="text" name="product" id="product">
        <br>
        <label for="price">Ustaw cenę</label>
        <input type="range" name="price" id="price" min="0" max="200">
        <button>Dodaj</button>
    </form>
</body>
</html>
<?php
$link -> close();
?>