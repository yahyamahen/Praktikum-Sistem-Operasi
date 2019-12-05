#!/bin/bash

declare -a matirks1
declare -a matriks2
pilih=1

while :; do
clear

echo "Program Perkalian Matriks 2x2"
echo "1. Input nilai"
echo "2. View nilai matriks"
echo "3. Operasi kali matriks"
echo "4. Exit program"

echo -n "Pilih menu : ";
read pilih

if [ $pilih == 1 ]
then
	clear
	echo "Masukkan nilai matriks satu :"
	for ((i=0; i<=3; i++)) 
	do
		echo -n "Nilai ke-"$(( $i + 1))" : "
		read nilai
		
		matirks1[$i]=$nilai
	done
	
	echo ""
	echo "Masukkan nilai matriks dua :"
	for ((i=0; i<=3; i++)) 
	do
		echo -n "Nilai ke-"$(( $i + 1))" : "
		read nilai
		
		matriks2[$i]=$nilai
	done
elif [ $pilih == 2 ]
then
	clear
	echo "Nilai pada matriks satu"
	for ((i=0; i<4; i++)) 
	do
		echo -n "${matirks1[$i]} "

		if [ $i == 1 ]
		then
			echo ""
		fi
	done

	echo ""
	echo ""
	
	echo "Nilai pada matriks dua"
	for ((i=0; i<4; i++)) 
	do
		echo -n "${matriks2[$i]} "

		if [ $i == 1 ]
		then
			echo ""
		fi
	done

	read
elif [ $pilih == 3 ]
	then
	clear
	declare -a matriksH

	for ((i=0; i<2; i++)) 
	do
		for ((j=0; j<2; j++)) 
		do
			let matriksH[$i]+=matirks1[$j]*matriks2[$i+$j*2]
		done
	done

	for ((i=0; i<2; i++)) do
		for ((j=0; j<2; j++)) do
			let matriksH[$i+2]+=matirks1[$j+2]*matriks2[$i+$j*2]
		done	
	done
	
	echo "Hasil perkalian"
	for ((i=0; i<4; i++)) 
	do
		echo -n "${matriksH[$i]} "

		if [ $i == 1 ]
		then
			echo ""
		fi
	done
	unset matriksH
	read
elif [ $pilih == 4 ]
then
	exit
else 
	echo "input pilih menu salah";
fi 

done
