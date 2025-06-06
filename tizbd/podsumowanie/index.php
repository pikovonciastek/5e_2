<?php
$link = new mysqli ("localhost", "root", "", "w3schools");
$sql = "select * from suppliers";
$result = $link -> query($sql);
$suppliers = $result -> fetch_all(1);

$supplierF= $_POST['supplier'] ?? null;
$productF= $_POST['product'] ?? null;
$priceF= $_POST['price'] ?? null;
if ($supplierF && $productF && $priceF) {
   $sql="insert into products(SupplierID, ProductName, Price) values($supplierF, '$productF', $priceF)";
    $result = $link -> query($sql);
    $newproduct = $result -> fetch_all(1);
}



$sql = "select supplierName, format(min(price),2,'pl-PL') from products join suppliers on products.SupplierID = suppliers.SupplierID group by products.supplierID";

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
    table {
    border-collapse: collapse;
     width: 50%;
     margin: 20px auto;
    }

    th, td {
    border: 1px solid black;
    padding: 8px;
    }

    </style>
</head>
<body>
    <h3>Zadanie 1</h3>
    <form action="" method="post">
        <label for="supplier">Wybierz dostawcę</label>
        <select name="supplier" id="supplier">
        <?php
        foreach($suppliers as $supplier){
            echo "<option value='{$supplier['SupplierID']}'> {$supplier['SupplierName']} </option>";
        }
        ?>
        </select>
        <br>
        <label for="product">Wpisz nazwę towaru</label>
        <input type="text" name="product" id="product">
        <br>
        <label for="price">Ustaw cenę</label>
        <input type="range" name="price" id="price" min="0" max="200" step="0.1">
        <br>
        <button>Dodaj</button>
    </form>
    <h3>Zadanie 2</h3>
    <table>
        <tr>
            <td>Dostawca</td>
            <td>Średnia</td>
            <td>Minimalna</td>
            <td>Maksymalna</td>
        </tr>

    
    </table>
</body>
</html>
<?php
$link -> close();
?>