<?php
$link = new mysqli('localhost', 'root', '', 'formularze_4e2gr');
$sql = "SELECT * from uczen";
$result = $link -> query($sql);
$students = $result -> fetch_all(mode: 1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <h1>Uczniowie</h1>
    <h2>Lista uczniów</h2>
    <table>
    <?php
    foreach($students as $student){
        echo "<tr>";
        foreach($student as $field){
        echo "<td> $field </td>";
        }
        echo "</tr>";
    }
    ?>
    </table>

    <h2>Aktualizacje</h2>
    <form action="aktualizacja.php" method="post"></form>
    <label for="studentID">Podaj ID:</label>
    <input type="number" name="studentID" id="studentID">
    <input type="submit" value="wyślij">
    </form>
    
    <h2>Usuwanie</h2>
    <form action="usuwanie.php" method="post"></form>
    <label for="studentID">Podaj ID:</label>
    <input type="number" name="studentID" id="studentID">
    <input type="submit" value="wyślij">
    </form>
</body>
</html>
<?php
$link -> close();
?>