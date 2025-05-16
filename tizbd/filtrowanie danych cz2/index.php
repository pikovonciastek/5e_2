<?php
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

$sql= "select Customername from customers where country = 'France'";
$result = $link -> query($sql);
$France = $result -> fetch_all(mode: 1);
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
    <select name="country_form">
        <?php
        foreach($country as $c_f){
            echo "<option value='{$c_f['country']}'>{$c_f['country']}</option>";
        }
        ?>
    </select>
    <button>Wyślij</button>
</form>
<ul>
    <?php
    foreach($clients as $client){
        echo "<li>{$client['customername']}</li>";
    }
    ?>
</ul>
</body>
</html>
<?php
$link -> close();
?>