#!/bin/bash

a=123
cadena="hola"
caracter='a'

a=1
b=2
c=3

sum=$((a * b * c))

#echo "hola Mundo"

#echo "$a $cadena $caracter"

#echo "La suma es: $sum"

if [ $a -gt $b ] # a >= b?
then
        echo "$b es mayor que $a"
fi

file="magoa"

if [ -e $file ]
then
        echo "Si existe $file"
#else
        #echo "No existe $file"
fi

for i in $(seq 1 10)
do
        echo "$i"

        for j in $(seq 1 5)
        do
                echo -e "\t$j"
        done
done

x=1

while [ $x -le 10 ] # x <= 10
do
        echo "test"
        x=$((x + 1))
done

#while [ True ]
#do
#       read -p "sql> "
#done


array=(1 "uno" 2 "dos")

array+=(3 "tres") # union de vectores o adicionar un elemento en el vector como tal

echo ${array[@]}

for element in ${array[@]}
do
        echo "$element"
done
