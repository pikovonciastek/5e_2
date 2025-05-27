<?php
$link = new mysqli("localhost", "root", "", "w3schools");

$product = $_POST['product'] ?? null;
$rise = $_POST['rise'] ?? null;
if ($product && $rise) {
    $sql = "update products set price = price + price * $rise where productid = $product";
    $result = $link -> query($sql);
} else {
    $result = null;
}


$sql = "SELECT productName, price FROM products JOIN suppliers ON products.supplierID = suppliers.supplierID";
$result = $link -> query($sql);
$products = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            font-size: 15px;
        }
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
        </tr>
        <?php foreach ($products as $product){
            echo 
            "<tr>
            <td> {$product['productName']} </td>
            <td> {$product['price']} </td> 
            </tr>";
        } ?>
    </table>
    <br>
    <form action="" method="post">
        <label for="product">Wybierz produkt</label>
        <select name="product" id="product">
        <?php 
            foreach ($products as $product) {
                echo "<option value='{$product['productid']}'>{$product['productName']}</option>";
            }
        ?>
        </select>
        <br>
        <label for="rise">Podwyżka o :</label>
        <input type="range" name="rise" id="rise" min="0" max="0.1" step="0.01">10%
    </form>
</body>
</html>
<?php
$link -> close();
?>


<!--
select productname, price from products join products.supplierID = suppliers.supplierID;

select productid, productname from products;


update products set price = price + price * 0.1 where productid = 1;
-->