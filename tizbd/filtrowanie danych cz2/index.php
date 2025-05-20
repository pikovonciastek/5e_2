<?php
//zadanie 1
$link = new mysqli('localhost', 'root', '', 'w3schools');
$sql= "select distinct country from customers order by country";
$result = $link -> query($sql);
$country = $result -> fetch_all(mode: 1);
$selected = $_POST['country_form'] ?? null;
if($selected){
    $sql= "select customername from customers where country = '$selected'";
} else {
    $sql= "select customername from customers";
}
$result = $link -> query($sql);
$clients = $result -> fetch_all(mode: 1);

$sql= "select customername from customers";
$result = $link -> query($sql);
$customers = $result -> fetch_all(mode: 1);

//zadanie 2
$listed = $_POST['prd'] ?? null;
if ($listed){
    $sql= "select productname, round(price,2) from products where productname like '%$listed%'";
} else {
    $sql= "select productname, round(price,2) from products";
};
$result = $link -> query($sql);
$products = $result -> fetch_all(mode: 1);


// ZADANIE 3
$sql = "SELECT MIN(price) AS min_price, ROUND(AVG(price), 2) AS avg_price, MAX(price) AS max_price FROM products";
$result = $link->query($sql);
$stats = $result->fetch_assoc();
$min = $stats['min_price'];
$avg = $stats['avg_price'];
$max = $stats['max_price'];
$from = $_POST['price_from'] ?? null;
$to = $_POST['price_to'] ?? null;
if ($from !== null && $to !== null && is_numeric($from) && is_numeric($to)) {
    $sql = "SELECT productname, ROUND(price, 2) AS price FROM products WHERE price BETWEEN $from AND $to";
    $result = $link->query($sql);
    $filtered_products = $result->fetch_all(MYSQLI_ASSOC);
} else {
    $filtered_products = [];
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
    <h2>Zadanie 1</h2>
<form action="" method="post">
    <select name="country_form">
        <?php
        foreach($country as $c_f){
            echo "<option value='{$c_f['country']}'>{$c_f['country']}</option>";
        }
        ?>
    </select>
    <button>Search</button>
</form>
<ul>
    <?php
    foreach($clients as $client){
        echo "<li>{$client['customername']}</li>";
    }
    ?>
</ul>


<h2>Zadanie 2</h2>
<form action="" method="post" name="prd">
<input type="text">
<button>Search</button>

<?php
    foreach($products as $product){
        echo "<br> {$product['productname']} {$product['round(price,2)']} zł";
    }
?>
</form>


<h2>Zadanie 3</h2>

<form method="post">
    <label>Od:
    <select name="price_from">
        <option value="<?= $min ?>">Minimalna (<?= $min ?> zł)</option>
        <option value="<?= $avg ?>">Średnia (<?= $avg ?> zł)</option>
    </select>
    </label>
    <label>Do:
    <select name="price_to">
        <option value="<?= $avg ?>">Średnia (<?= $avg ?> zł)</option>
        <option value="<?= $max ?>">Maksymalna (<?= $max ?> zł)</option>
    </select>
    </label>
<button type="submit">Filtruj</button>
</form>

<h3>Wyniki:</h3>
<ul>
 <?php foreach ($filtered_products as $product): ?>
<li><?= $product['productname'] ?> - <?= $product['price'] ?> zł</li>
 <?php endforeach; ?>
</ul>






</body>
</html>
<?php
$link -> close();
?>