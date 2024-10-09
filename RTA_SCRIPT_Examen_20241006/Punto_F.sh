#!/bin/bash 

# Navegar al directorio del repositorio
cd ~/repogit/UTNFRA_SO_1P2C_2024_Nazadek

echo
echo "Filtro Avanzado: "
echo "Mi ip publica es: $(curl -s ifconfig.me)" > RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt
echo
echo "Mi usuario es: $USER" >> RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt
echo
echo "Hash del usuario $USER:" >> RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt
sudo grep "^$USER:" /etc/shadow >> RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt
echo
echo "La url de mi repo es: $(git remote get-url origin)" >> RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt

echo
echo "Muestro archivo: "
cat RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt
echo
