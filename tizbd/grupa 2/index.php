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

$sql = 'select SupplierID, SupplierName from suppliers;';
$result = $link -> query($sql);
$suppliers = $result -> fetch_all(mode: 1);

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtrowanie danych</title>
    <style>
        table, td, th {
            border: 1px solid;
            border-collapse: collapse;
        }
    </style>
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
        <br><input type="submit" value="Filtruj">
        </label>    
</form>
<table>
    <tr>
    <th>Nazwa produktu</th>
    <th>Nazwa kategorii</th>
    <th>Cena</th>
    </tr>
    <?php
    foreach($products as $product){
        echo "
        <tr>
        <td>{$product['ProductName']}</td>
        <td>{$product['Categoryname']}</td>
        <td>{$product['Price']}</td>
        </tr>
        ";
    }
    ?>
</table>

<form action="" method="post">
    <label for="suppID">Wybierz dostawcę</label>
    <select name="suppID" id="suppID">
        <?php
            foreach($suppliers as $supplier){
            echo "{$supplier['SupplierName']}";
            }
        ?>
    </select>
</form>

</body>
</html>
<?php
$link -> close();
?>
