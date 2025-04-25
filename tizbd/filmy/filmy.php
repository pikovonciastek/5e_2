<?php
$link = new mysqli('localhost', 'root', '', 'filmy_AS');

//nowy rezyser
if (isset($_POST['imie']) && isset($_POST['nazwisko'])) {
    $imie = $_POST['imie'];
    $nazwisko = $_POST['nazwisko'];

    if (!empty($imie) && !empty($nazwisko)) {
        $sql = "INSERT INTO rezyserzy (imie, nazwisko) VALUES ('$imie', '$nazwisko')";
        if ($link->query($sql) === TRUE) {
            echo "$imie $nazwisko został dodany.";
        } else {
            echo "Błąd: " . $sql . "<br>" . $link->error;
        }
    } else {
        echo "Proszę wypełnić wszystkie pola.";
    }
}


//usuwanie
if (isset($_POST['tytul'])) {
    $tytul = $_POST['tytul'];
    $sql = "DELETE FROM filmy WHERE tytul='$tytul'";
    if ($link->query($sql) === TRUE) {
        echo "Film został usunięty.";
    } else {
        echo "Błąd: " . $sql . "<br>" . $link->error;
    }
}

//zmiana tytulu
if (isset($_POST['idFILM']) && isset($_POST['oldtytul']) && isset($_POST['newtytul'])) {
    $id = $_POST['idFILM'];
    $oldtytul = $_POST['oldtytul'];
    $newtytul = $_POST['newtytul'];
    
    if (!empty($id) && !empty($oldtytul) && !empty($newtytul)) {
        $sql = "UPDATE filmy SET tytul='$newtytul' WHERE idFILM='$id' AND tytul='$oldtytul'";
    if ($link->query($sql) === TRUE) {
        echo "Tytuł filmu został zmieniony.";
        } else {
        echo "Błąd: " . $sql . "<br>" . $link->error;
        }
    } else {
        echo "Proszę wypełnić wszystkie pola.";
        }
    }


header("refresh:10;url=index.php");
echo "<br>Zostaniesz przekierowany do strony głównej za 10 sekund.";

$link->close();
?>
