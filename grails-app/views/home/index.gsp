<%--
  Created by IntelliJ IDEA.
  User: Albonie
  Date: 06.09.2021
  Time: 13:12
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Formularz</title>
</head>

<body>
<g:form id="formularz" action="blank.html" url="[action:'result', controller:'home']" onsubmit="send()">
    Podaj markę auta:
    <input type="text" id="marka" onfocusout="checkIfAvailable()" required>
    <p id="pole1" style="color: red;"></p><br>
    Podaj model auta:
    <input type="text" onfocusout="checkIfContainsDigits()" id="model" required>
    <p id="pole2" style="color: red;"></p><br>
    Podaj przebieg auta (w km):
    <input type="number" id="przebieg"onfocusout="checkIfModified()" required>
    <p id="pole3" style="color: red;"></p><br>
    Podaj rocznik auta:
    <input type="number" id="rocznik" max="2000" onkeyup="checkYear()" onfocusout="checkYearError()" required >
    <p id="pole4" style="color: red;"></p><br>
    Podaj moc auta (HP):
    <input type="number" id="moc" onfocusout="checkIfNull()" required>
    <p id="pole5" style="color: red;"></p><br>
    <input type="submit" id="send" value="Wyślij">
</g:form>
</body>
</html>


<script>
    function checkIfAvailable() {
        let marka = document.getElementById("marka").value;
        if (marka === "" || marka == null) {
            document.getElementById("pole1").innerHTML = "Podaj markę!"
            document.getElementById("marka").style.borderColor = "red"
        }
        else {
            document.getElementById("pole1").innerHTML = " "
            document.getElementById("marka").style.borderColor = "black"
        }
        if (marka.toLowerCase() === "seat" || marka.toLowerCase() === "bmw") {
            alert("Nie obsługujemy tej marki :/")
            document.getElementById("marka").style.borderColor = "red"
            document.getElementById("marka").value = ""
        }
        else {
            document.getElementById("marka").style.borderColor = "black"
        }
    }

    function checkIfContainsDigits() {
        let model = document.getElementById("model").value
        let rule = /^[a-zA-Z]*$/
        if (model === "") {
            document.getElementById("pole2").innerHTML = "Podaj model!"
            document.getElementById("model").style.borderColor = "red"
        }
        else {
            document.getElementById("pole2").innerHTML = ""
            document.getElementById("model").style.borderColor = "black"
        }
        if (!rule.test(model)) {
            alert("W modelu nie mogą być cyfry")
            document.getElementById("model").style.borderColor = "red"
            document.getElementById("model").value = ""
        }
        else {
            document.getElementById("model").style.borderColor = "black"
        }

    }

    function checkIfModified() {
        let przebieg = document.getElementById("przebieg").value;
        if (przebieg === "") {
            document.getElementById("pole3").innerHTML = "Podaj przebieg!"
            document.getElementById("przebieg").style.borderColor = "red"
        }
        else {
            document.getElementById("pole3").innerHTML = ""
            document.getElementById("przebieg").style.borderColor = "black"
        }
        if (przebieg >= 0 && przebieg < 50000)
            alert("Pewnie kręcony")
    }

    function checkYear() {
        let rocznik = document.getElementById("rocznik").value;
        if (rocznik > 2000)
            document.getElementById("rocznik").value = "";
    }

    function checkYearError() {
        let rocznik = document.getElementById("rocznik").value;
        if (rocznik === "") {
            document.getElementById("pole4").innerHTML = "Podaj rocznik!"
            document.getElementById("rocznik").style.borderColor = "red"
        } else {
            document.getElementById("pole4").innerHTML = ""
            document.getElementById("rocznik").style.borderColor = "black"
        }
    }

    function checkIfNull() {
        let moc = document.getElementById("moc").value;
        if (moc === "") {
            alert("Moc nie może być pusta");
            document.getElementById("pole5").innerHTML = "Podaj moc!"
            document.getElementById("moc").style.borderColor = "red"
        } else {
            document.getElementById("pole5").innerHTML = ""
            document.getElementById("moc").style.borderColor = "black"
        }
    }

</script>