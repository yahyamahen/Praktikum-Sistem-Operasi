#!/bin/bash
clear
i=0
declare -a idFile
declare -a namaFile
declare -a namaOwner
declare -a jenis
declare -a ekstensi
declare -a tanggalPembuatan

input(){
	echo -e "\nInput Data File ke-$[i+1]"
	echo -n "ID File           : "
  	read idFile[$i]
	echo -n "Nama File         : "
	read namaFile[$i]
  	echo -n "Owner             : "
 	read namaOwner[$i]
	echo -n "Jenis File        : "
  	read jenis[$i]
  	echo -n "Ekstensi          : "
  	read ekstensi[$i]
  	echo -n "Tanggal Pembuatan : "
  	read tanggalPembuatan[$i]
	i=`expr $i + 1`	
}

view(){
	echo "Data File dlm Direktori"			
	if(( $i == 0 ))
	then
		echo "Buat file terlebih dahulu"
	else 
		for (( q=0; q<i; q++ ))
		do
			echo -e "Data File ke-$[q+1]"
			echo -e "ID File 		:  ${idFile[$q]}"
			echo -e "Nama File 		:  ${namaFile[$q]}"
          		echo -e "Nama Owner 		:  ${namaOwner[$q]}"
			echo -e "Jenis File 		:  ${jenis[$q]}"
			echo -e "Ekstensi File 		:  ${ekstensi[$q]}"
			echo -e "Tanggal Pembuatan File  :  ${tanggalPembuatan[$q]}"
			echo ""
		done
	fi
}

search(){
	flag=0
	if(( $i == 0 ));
	then
		echo "Buat file terlebih dahulu"
	else
	    echo -n "Masukkan ID File yang ingin di-tampilkan : "
		read cariID		
		for(( c=0; c<i; c++ ))
		do
			if [[ $cariID -eq ${idFile[$c]} ]]; 
			then
				echo -e "\nData File ke-$[c+1]"
				echo -e "ID File 		:  ${idFile[$c]}"
				echo -e "Nama File 		:  ${namaFile[$c]}"
		        echo -e "Nama Owner 		:  ${namaOwner[$c]}"
				echo -e "Jenis File 		:  ${jenis[$c]}"
				echo -e "Ekstensi File 		:  ${ekstensi[$c]}"
				echo -e "Tanggal Pembuatan File  :  ${tanggalPembuatan[$c]}"
				echo ""
				flag=`expr $flag + 1`					
				break
			fi
		done 
		if (( $flag == 0 )); 
		then
			echo "ID File tidak ditemukan";
		fi
	fi
}

update(){
    flag=0
	if(( $i == 0 ));
	then
		echo "Buat file terlebih dahulu"
	else
		view
	    echo -n "Masukkan ID File yang ingin di-update : "
		read cariID		
		for(( u=0; u<i; u++ ))
		do
			if [[ $cariID -eq ${idFile[$u]} ]];  
			then
				echo -n "Update Nama File         : "
				read namaFile[$u]
			  	echo -n "Update Owner             : "
			 	read namaOwner[$u]
				echo -n "Update Jenis File        : "
			  	read jenis[$u]
			  	echo -n "Update Ekstensi          : "
			  	read ekstensi[$u]
			  	echo -n "Update Tanggal Pembuatan : "
			  	read tanggalPembuatan[$u]	
			  	flag=`expr $flag + 1`	
				break
			fi
		done 
		if (( $flag == 0 )); 
		then
			echo "ID File tidak ditemukan";
		fi
	fi
}

delete(){
 flag=0
	if(( $i == 0 ));
	then
		echo "Buat file terlebih dahulu"
	else
		view
	    echo -n "Masukkan ID File yang ingin di-delete : "
		read cariID		
		for(( d=0; d<i; d++ ))
		do
			if [[ $cariID -eq ${idFile[$d]} ]];  
			then
				idFile[$d]=idFile[$i-1]
				i=`expr $i - 1`	
			  	flag=`expr $flag + 1`	
			  	echo "Data berhasil didelete"
				break
			fi
		done 
		if (( $flag == 0 )); 
		then
			echo "ID File tidak ditemukan";
		fi
	fi
}

while :;
do
    echo "=== Program Sistem Informasi Pengolahan File ===";
    echo -e "Masukan menu \n1. Input Data \n2. View Data \n3. Search Data \n4. Update Data \n5. Delete Data\n11. Keluar Program";
    echo ""  
    echo "=== Pengolahan File Dalam Direktori Ini ===";
    echo -e "6. Lihat Isi Direktori\n7. Buat/Masuk kedalam direktori ini\n8. Hapus File/Direktori\n9. Keluar dari direktori saat ini\n10. Ubah hak akses file/direktori\n11. Keluar Program"
   
    echo -n "pilih menu : "
    read pilih
	if (("$pilih" == 1));   # INPUT DATA
 	then
        clear
        input
	    clear
	
	elif (("$pilih" == 2));   # VIEW DATA
 	then
        clear
	    view 
	   
	elif (("$pilih" == 3));   # SEARCH DATA
 	then
 	    clear
	    search
	
	elif (("$pilih" == 4));   # UPDATE DATA
	then
	    clear
	    update
	    clear

	elif (("$pilih" == 5));   # DELETE DATA
	then
	    clear
	    delete
	elif (("$pilih" == 6));   # LIHAT ISI FILE
	then
	    ls -l
	elif (("$pilih" == 7));   # BUAT FOLDER
	then 
		clear
		ls -l
		read -p "buat/masuk direktori : " buat 
		mkdir "$buat"
		while [[ $masukfoler != 'y' || $masukfolder != 'n' ]];
		echo -n "Apakah ingin masuk ke folder $buat? (y/n)";	read masukfolder		
		do		
			if [[ $masukfolder == 'y' || $masukfoler == 'Y' ]]; then		
				cd "$buat"
				echo "masuk direktori $buat"				
				break
			elif [[ $masukfolder == 'n' || $masukfoler == 'N' ]]; then
				echo "gak masuk direktori $buat"					
				break			
			fi
		done
		clear
	elif (("$pilih" == 8));   # HAPUS FILE
	then 
		clear
		ls -l
		read -p "hapus file/direktori : " hapus 
		while [[ $hapusfoler != 'y' || $hapusfolder != 'n' ]];
		echo -n "Apakah ingin hapus ke folder $hapus? (y/n)";	read hapusfolder		
		do		
			if [[ $hapusfolder == 'y' || $hapusfoler == 'Y' ]]; then		
				rm -r "$hapus"
				echo "Berhasil dihapus $hapus"				
				break
			elif [[ $hapusfolder == 'n' || $hapusfoler == 'N' ]]; then
				echo "gak jadi hapus $hapus"					
				break			
			fi
		done
		clear

	elif (("$pilih" == 9));
	then
	    cd ".."	
	    echo "Keluar dari direktori saat ini" 
	elif (("$pilih" == 10));
	then
	    clear
	    echo "Manipulasi Hak Akses File/Direktori"
	    echo "4 untuk Read"
	    echo "2 untuk Write"
	    echo "1 untuk Execute"
	    echo "Berlaku pada setiap kelipatan (User/Group/Others)"
	    ls -l	
	    read -p "pilih file : " pilihfile
	    echo "Manipulasi akses $pilihfile"
	    read -p "User   : " user
	    read -p "Group  : " group 
	    read -p "Others : " others	    
	    while [[ $manipulasifile != 'y' || $manipulasifile != 'n' ]]; 
		do		
		echo -n "yakin ingin manipulasi chmod $user$group$others $pilihfile ?(y/n) : ";	read manipulasifile
		if [[ $manipulasifile = 'y' || $manipulasifile = 'Y' ]]; then					
	     	    echo "chmod $user$group$others $pilihfile"				
		    chmod $user$group$others "$pilihfile"				
		    break
		elif [[ $manipulasifile = 'n' || $manipulasifile = 'N' ]]; then
	            echo "Gak jadi chmod $user$group$others $pilihfile"				
		    break			
		fi
	     done
	     clear
	elif [[ "$pilih" -eq 11 ]]; 
	then
	    exit	
	    break
	elif [[ "$pilih" -gt 0 || "$pilih" -lt 11 ]];
 	then
	    echo "Pilihannya gaada";
	    read
        clear	
	fi
done
