<?php
$link = new mysqli ("localhost", "root", "", "w3schools");
$type_f = $_POST['type_f'] ?? null;
if ($type_f) {
    if($type_f == "supplier"){
        $sql = "select productname, suppliername, price from products join suppliers on products.supplierID = suppliers.SupplierID";
    }
    else if ($type_f=="category"){
        $sql = "select productname, categoryname, price from products join categories on products.categoryid = categories.categoryid";
    }
    else {
        $sql = "select productname, price from products";
    }
    $result = $link -> query($sql);
    $products = $result -> fetch_all();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3>zadanie 4</h3>
    <form action="" method="post">
        <input type="radio" name="type_f" id="supplier" value="supplier">
        <label for="supplier">Dostawca</label>
        <input type="radio" name="type_f" id="category" value="category">
        <label for="category">kategoria</label>
        <br>
        <button>wyślij</button>
    </form>
    <table>
        <tr>
            <td>nazwa</td>
            <td>kategoria</td>
        </tr>
        
        <?php
        if ($type_f) {
            foreach($products as $product){
                echo "<tr>
                <td> {$product[0]} </td>
                <td> {$product[1]} </td>
                <td> {$product[2]} </td>
                </tr>";
            }
        }
        ?>
        
    </table>
</body>
</html>
<?php
$link -> close();
?>