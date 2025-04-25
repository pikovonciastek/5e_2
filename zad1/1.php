<?php
$link = new mysqli('localhost', 'root', '', 'dania');
$sql = " SELECT nazwa FROM dania";
$result = $link -> query($sql);
$dishes = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dania</title>
</head>
<body>
    <h2>nazwy dań</h2>
    <ol>
        <?php
        foreach($dishes as $dish){
            echo "<li> {$dish['nazwa']} </li>";
        }
        ?>
    </ol>
</body>
</html>

<?php
    $link -> close();
?>