<?php
$link = new mysqli('localhost', 'root', '', 'raport_06_4e_02');
$sql = "select miesiac, rok from zadania where dataZadania = '2020-07-01'";
$result = $link -> query($sql);
$days = $result -> fetch_all(mode: 1);
//
$sql = "select dataZadania, wpis from zadania where miesiac = 'lipiec'";
$result = $link -> query($sql);
$tasks = $result -> fetch_all(mode: 1);
//
if(!empty($_POST['task'])){
    $task = $_POST['task'];
    $sql = "insert into zadania(dataZadania, wpis, miesiac, rok)
    values('2020-07-03', '$task', 'lipiec', '2020')";
    $result = $link -> query($sql);
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mój kalendarz</title>
    <link rel="stylesheet" href="styl5.css">
</head>
<body>
    <header>
        <section class="one">
        <img src="logo1.png" alt="mój kalendarz"></img>
        </section>
    </header>
 <section class="two">
    <h1>kalendarz</h1>
    <!-- skrypt1 -->
     
        <?php
        foreach ($days as $day){
            echo "<h3> miesiąc: {$day['miesiac']} rok: {$day['rok']}</h3>";
        }
        ?>
    
 </section>
<main>
    <!-- skrypt2 -->
     <!-- <section class="task">
        <h5>Data</h5>
        <p>wpis:</p>
     </section> -->
     <?php
    foreach ($tasks as $task){
    echo "<section class='task'>
        <h5>Data: {$task['dataZadania']}</h5>
        <p>wpis: {$task['wpis']}</p>
     </section>";
    }
     ?>
</main>
 <footer>
    <form method="POST">
        dodaj wpis
        <input type="text" name="task" id="">
        <button>dodaj</button>
    </form>
    <p>stronę wykonał ###</p>
 </footer>
</body>
</html>

<?php
$link -> close();
?>