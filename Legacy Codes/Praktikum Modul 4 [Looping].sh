#!/bin/bash

pilih=0
until [[ $pilih -lt 0 && $pilih -gt 2 ]];
do
    echo "";
    echo "1. Menu Utama";
    echo "2. Exit Program";
    echo -n "Pilih menu : ";
    read pilih
    if [ $pilih -eq 1 ];
        then
        echo -n "Masukan nilai batas : ";
        read batas
        i=1
        khusus=5
        genap=2
        while  [ $i -le $batas ];
            do
            if [[ $i%$khusus -eq 0 ]];
                then
                echo " Kode-"$i "Khusus ";            
            elif [[ $i%$genap -eq 0 ]];
                then
                echo -n " Kode-"$i "Genap, ";         
            else         
                echo -n " Kode-"$i "Ganjil, ";                        
            fi
            let i=$i+1;
            done
    elif [ $pilih -eq 2 ];
        then
        echo "Terimakasih";
        exit 0;
    else 
        echo "Masukan hanya (1/2)!"    
    fi
done 
