#!/bin/bash

sudo mkdir -p Estructura_Asimetrica/{correo,cliente}/cartas_{1..100}
sudo mkdir -p Estructura_Asimetrica/correo/cartas_1/carteros_{1..10}
sudo mkdir -p Estructura_Asimetrica/cliente/cartas_1/carteros_{1..10}



echo "Valido estructura"

tree Estructura_Asimetrica --noreport | pr -T -s' ' -w 80 --columns 4

