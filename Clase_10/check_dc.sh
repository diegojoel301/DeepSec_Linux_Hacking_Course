#!/bin/bash

version=$(uname -a | grep -E "[0-4]\.[0-9]{0,2}\.[0-9]{0,2}")


if [ -n "$version" ] # no esta vacia la salida por tanto hay salida
then
        echo "Es vulnerable a dirty cow"
else
        echo "No es vulnerable a dirty cow"
fi
