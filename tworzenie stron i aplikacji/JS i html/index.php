<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zegar</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="zegar"></div>
    <p class="jakisTEKST">jakiś tekst</p>
    <button data-action="zmien">Zmień</button>
    <button data-action="motyw">Zmień motyw</button>

    <script type="text/javascript">
        function aktualizujCzas() {
            let czas = new Date();
            let godzina = czas.getHours().toString().padStart(2, '0');
            let minuta = czas.getMinutes().toString().padStart(2, '0');
            let sekunda = czas.getSeconds().toString().padStart(2, '0');

            let wyswietl = `${godzina}:${minuta}:${sekunda}`;
            document.getElementById("zegar").textContent = wyswietl;
        }

        setInterval(aktualizujCzas, 1000);

        let akapit = document.querySelector('.jakisTEKST');
        let przycisk = document.querySelector('[data-action="zmien"]');

        przycisk.addEventListener('click', () => {
            akapit.textContent = 'Na Pałukach słońce lśni, Między jeziorami płyną łódką sny.';
        });

        const body = document.body;
        const button = document.querySelector('[data-action="motyw"]');

        button.addEventListener("click", () => {
            body.classList.toggle("dark-theme");
        });
    </script>


    <h2>Kontakt</h2>
    <form action="" method="post" id="kontakt">
    <input type="text" id="imie" placeholder="Twoje imię">
    <input type="email" id="email" placeholder="Twój email">
    <button type="submit">Wyślij</button>
    </form>
    <p id="komunikat">???</p>

    <script type="text/javascript">
        let formularz = document.getElementById('kontakt');
        let komunikat=document.getElementById('komunikat');
        formularz.addEventListener('submit', (e) => {
        e.preventDefault();
        let imie = document.getElementById('imie').value.trim();
        let email = document.getElementById('email').value.trim();
        if (imie === '' || email === ''){
            komunikat.textContent = 'uzupełnij wszystkie pola';
            komunikat.style.color='red';
        } else {
            komunikat.textContent = `Dziękujemy, ${imie}!`;
            komunikat.style.color='green';
        }});
    </script>
    
</body>
</html>