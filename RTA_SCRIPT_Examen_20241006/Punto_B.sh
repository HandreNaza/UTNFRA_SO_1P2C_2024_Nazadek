#!/bin/bash

DISCO=$(sudo fdisk -l | grep Disk | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

echo "Particiono el disco: $DISCO"
echo

sudo fdisk $DISCO << EOF

n
p
1

+1G
n
e
2


n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G



w
EOF


echo
echo "Mis Particiones: "
sudo fdisk -l $DISCO
echo
echo "Formateo las Particiones: "
sudo fdisk -l $DISCO |grep $DISCO |grep -viE 'Disk|exten' |awk '{print "sudo mkfs.ext4 "$1}' |/bin/bash 
echo
echo "Montando las Particiones:"

sudo mount ${DISCO}1 /Examenes-UTN/alumno_1/parcial_1
sudo mount ${DISCO}5 /Examenes-UTN/alumno_2/parcial_1
sudo mount ${DISCO}6 /Examenes-UTN/alumno_2/parcial_2
sudo mount ${DISCO}7 /Examenes-UTN/alumno_2/parcial_3
sudo mount ${DISCO}8 /Examenes-UTN/alumno_3/parcial_1
sudo mount ${DISCO}9 /Examenes-UTN/alumno_3/parcial_2
sudo mount ${DISCO}10 /Examenes-UTN/alumno_3/parcial_3
sudo mount ${DISCO}12 /Examenes-UTN/alumno_1/parcial_2
sudo mount ${DISCO}13 /Examenes-UTN/alumno_1/parcial_3
sudo mount ${DISCO}11 /Examenes-UTN/profesores

# Validar el montaje
echo "Particiones montadas:"
df -h | grep Examenes-UTN



