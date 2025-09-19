let ceny = {
  "React.js": 1500,
  "JavaScript": 1200
};

document.getElementById("obliczanie").onclick = function() {
  let kursy = "";
  let kwota = 0;

  if (document.getElementById("react").checked) {
    kursy += "React.js ";
    kwota += ceny["React.js"];
  }

  if (document.getElementById("js").checked) {
    kursy += "JavaScript ";
    kwota += ceny["JavaScript"];
  }

  let ratyElement = document.getElementById("raty");
  let liczbaRat = ratyElement.getAttribute("value") * 1;

  let miastoSelect = document.getElementById("miasta");
  let miasto = miastoSelect.options[miastoSelect.selectedIndex].innerHTML;

  let rata = (kwota / liczbaRat) + "";
  let kropka = rata.indexOf(".");
  if (kropka !== -1) {
    rata = rata.substr(0, kropka + 3);
  }

  let wynik = "Kurs odbędzie się w " + miasto + ". Koszt całkowity: " + kwota + " zł. Płacisz " + liczbaRat + " rat po " + rata + " zł.";
  document.getElementById("wynik").innerHTML = wynik;
  document.getElementById("wynik").style.color = "blue";
  document.getElementById("wynik").style.fontWeight = "bold";
};
