<?php
$link = new mysqli('localhost', 'root', '', 'w3schools');
$min_price = $_POST['min_price'] ?? null;
$max_price = $_POST['max_price'] ?? null;

if ($min_price && $max_price) {
    $sql = "select ProductName, Categoryname, Price from products join categories on Products.CategoryID = Categories.CategoryID where price between $min_price AND $max_price";
} else {
    $sql = "select ProductName, Categoryname, Price from products join categories on Products.CategoryID = Categories.CategoryID";
}
$result = $link -> query($sql);
$products = $result -> fetch_all(mode: 1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtrowanie danych</title>
</head>
<body>

<form method="post">
    <label for="min_price">
            Wpisz minimalną cenę
            <input type="number" name="min_price" id="min_price" value="0" REQUIRED>
        </label>
        <br>
        <label for="max_price">
            Wpisz maksymalną cenę
            <input type="number" name="max_price" id="max_price" value="1000" REQUIRED>
        </label>
        <label>
        <input type="submit" value="Filtruj">
        </label>    
</form> 
<?php

?>
</body>
</html>
<?php
$link -> close();
?>