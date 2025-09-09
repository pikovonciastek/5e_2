//Zad 1

let liczba1E = document.getElementById("liczba1");
let liczba2E = document.getElementById("liczba2");
let wyslij = document.getElementById('przycisk');
let wynik = document.getElementById("wynik");

wyslij.addEventListener('click', (e) => {
    e.preventDefault();

    let liczba1 = parseFloat(liczba1E.value);
    let liczba2 = parseFloat(liczba2E.value);
    
    let suma = liczba1 + liczba2;
    let iloczyn = liczba1 * liczba2;

    wynik.textContent = `Suma liczb to ${suma}, a iloczyn to ${iloczyn}.`;
});

//Zad 2

let naglowek = document.getElementById("header");
naglowek.addEventListener('click', (e) => {
    naglowek.textContent = "Aleksander Sagan";
});

//Zad 3

let krotkie = document.getElementById("krotkie");
let srednie = document.getElementById("srednie");
let poldlugie = document.getElementById("poldlugie");
let dlugie = document.getElementById("dlugie");
let result = document.getElementById("result");
let przycisk = document.getElementById("przycisk_wlosy");

przycisk.addEventListener('click', (e) => {
    e.preventDefault();
    if (krotkie.checked) {
        result.textContent = "Cena strzyżenia: 25";
    } else if (srednie.checked) {
        result.textContent = "Cena strzyżenia: 30";
    } else if (poldlugie.checked){
        result.textContent = "Cena strzyżenia: 40";
    } else if (dlugie.checked){
        result.textContent = "Cena strzyżenia: 50";
    } else {
        result.textContent = "Wybierz długość włosów";
    }
});