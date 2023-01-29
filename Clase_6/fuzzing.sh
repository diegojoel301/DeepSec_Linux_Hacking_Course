#!/bin/bash

function fuzzing()
{
	FUZZ=$1 # $x, x = 1, 2, 3, 4 es el parametro el cual se enviara al declarar la funcion

	code_state=$(curl -s -v "http://172.17.0.2/$FUZZ" 2>&1 | grep -E "< HTTP/1.1 [0-9]{1,3}" | awk '{print $3}')

	#echo "$code_state"

	if [ "$code_state" != "404" ]
        then
                echo $FUZZ
        fi
}

for cad in $(cat /usr/share/SecLists/Discovery/Web-Content/directory-list-2.3-small.txt)
do
	fuzzing "$cad" &
done
