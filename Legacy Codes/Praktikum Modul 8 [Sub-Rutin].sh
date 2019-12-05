#!/bin/bash
i=0
declare -a nama
declare -a npm
declare -a jurusan
declare -a fakultas

input(){
	npmtemp=0
	echo -n "Nama Mahasiswa  : "
  	read nama[$i]
	echo -n "NPM             : "
	read npm[$i]
  	echo -n "Progdi          : "
 	read jurusan[$i]
	echo -n "Fakultas        : "
  	read fakultas[$i]
	i=`expr $i + 1`	
}

view(){
	echo "Data Mahasiswa"			
		for (( q=0; q<i;q++  ))
		do
			echo -e "\nData ke $[q+1]"
			echo -e "NPM              :  ${npm[q]}"
			echo -e "Nama Mahasiswa   :  ${nama[q]}"
                                               echo -e "Progdi           :  ${jurusan[q]}"
			echo -e "Fakultas         :  ${fakultas[q]}"
			echo ""
		done
}

update(){
    flag=0
	if(( $i == 0 ))
		then
		echo "Masukan data mahasiswa terlebih dahulu"
	else
		view
	                echo -n "Masukkan data yang ingin di-update (Masukkan NPM) : "
		read cariNPM	
	
		for(( u=0; u<i; u++ ))
		do
			if (( $cariNPM == ${npm[$u]} )); then
				echo -n "Update Nama     : "
				read nama[$u]
				echo -n "Update Progdi   : "
				read jurusan[$u]
          	 	                               echo -n "Update Fakultas : "
         	  	                               read fakultas[$u]
				flag=`expr $flag + 1`	
				break
			fi
		done 
		if (( $flag == 0 )); then
			echo "NPM Mahasiswa tidak ditemukan";
		fi
	fi
}

while :;
do
    echo "=== Program Sistem Informasi Sederhana mhs ===";
    echo -e "Masukan menu \n1. Input Data \n2. View Data \n3. Update Data \n4. Exit";
    echo -n "pilih menu : "
    read pilih
	if (("$pilih" == 1));  then
                    clear
                    input
	    clear
	
	elif (("$pilih" == 2));  then
                   clear
	    view 

	elif (("$pilih" == 3));  then
	    update
	    clear
	
	elif (("$pilih" != 2 && "$pilih" != 1 && "$pilih" != 3 && "$pilih" != 4));  then
	    echo "Pilihannya gaada";
	    read
        clear
	else
	    exit
        fi
done
