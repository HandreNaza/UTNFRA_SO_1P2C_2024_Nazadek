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




