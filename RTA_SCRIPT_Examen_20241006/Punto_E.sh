#!/bin/bash

echo
echo "Filtro Basico: "

grep MemTotal /proc/meminfo > ~/repogit/UTNFRA_SO_1P2C_2024_Nazadek/RTA_ARCHIVOS_Examen_20241006/Filtro_basico.txt
grep "model name" /proc/cpuinfo | tail -n1 >> ~/repogit/UTNFRA_SO_1P2C_2024_Nazadek/RTA_ARCHIVOS_Examen_20241006/Filtro_basico.txt
echo "Información del chasis:" >> ~/repogit/UTNFRA_SO_1P2C_2024_Nazadek/RTA_ARCHIVOS_Examen_20241006/Filtro_basico.txt
sudo dmidecode -t chassis >> ~/repogit/UTNFRA_SO_1P2C_2024_Nazadek/RTA_ARCHIVOS_Examen_20241006/Filtro_basico.txt


echo
echo "Muestro archivo: "
cat ~/repogit/UTNFRA_SO_1P2C_2024_Nazadek/RTA_ARCHIVOS_Examen_20241006/Filtro_basico.txt
echo
