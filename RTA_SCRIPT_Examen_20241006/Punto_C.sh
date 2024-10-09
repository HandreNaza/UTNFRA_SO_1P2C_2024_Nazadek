#!/bin/bash

echo "Creo Grupo"
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
echo
echo "Creo usuario"
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores p1c2_2024_P1


echo "Ajusto los Permisos: "
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 750 /Examenes-UTN/alumno_2
sudo chmod -R 750 /Examenes-UTN/alumno_3
sudo chmod -R 750 /Examenes-UTN/profesores




echo "Ajusto Dueños: "
sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3


echo
echo "Valido permisos y owners"
sudo ls -ld /Examenes-UTN
sudo ls -l /Examenes-UTN
echo

echo "Creo archivo validar"
sudo -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
sudo -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
sudo -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
sudo -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1



echo

echo "Muestro permisos del archivo: "
sudo ls -l /Examenes-UTN/alumno_1/validar.txt
sudo ls -l /Examenes-UTN/alumno_2/validar.txt
sudo ls -l /Examenes-UTN/alumno_3/validar.txt
sudo ls -l /Examenes-UTN/profesores/validar.txt

echo "Muestro archivo: "
sudo cat /Examenes-UTN/alumno_1/validar.txt
sudo cat /Examenes-UTN/alumno_2/validar.txt
sudo cat /Examenes-UTN/alumno_3/validar.txt
sudo cat /Examenes-UTN/profesores/validar.txt

echo



LISTA=$1
USER_HASH=$2
HASH=$(sudo grep -i $USER_HASH /etc/shadow | awk -F ':' '{print $2}')	
 
ANT_IFS=$IFS
IFS=$'\n'

for LINEA in `cat $LISTA |  grep -v ^#`
do
	echo "Linea: $LINEA"
	echo
	USUARIO=$(echo $LINEA | awk -F ',' '{print$1}')
	GRUPO=$(echo $LINEA | awk -F ',' '{print$2}')
	if [ $(grep $GRUPO -c etc/group) == 0 ]; then
	       echo "sudo groupadd $GRUPO"
               echo "sudo useradd -m -p "$HASH" -s /bin/bash -G $GRUPO $USUARIO"
               echo "----------------------------------"
               echo
  	fi
done
IFS=$ANT_IFS

