#!/bin/bash
echo 'Program Konversi Detik ke Jam/Menit/Detik';
echo -n "Masukan Detik : "
read detik;
 
let jam=$detik/3600;
sisadetik=$(($detik-($jam*3600)));
let menit=$sisadetik/60;
detikmenit=$(($sisadetik-($menit*60)));
let menitjam=$sisadetik/60;
detikjam=$(($sisadetik-($menitjam*60)));

if [ $detik -lt 60 ]
    then
        echo "$detik detik";
elif [ $detik -lt 3600 ]
    then        
        if [ $detikmenit -eq 0 ]
            then
                echo "$menit menit";   
        else
                echo "$menit menit $detikmenit detik";
        fi
elif [ $detik -ge 3600 ]
    then
        if [ $detikjam -eq 0 ]
            then
                echo "$jam jam $menitjam menit";
        elif [ $menitjam -eq 0 ]
            then
                echo "$jam jam $detikjam detik"; 
        else            
                echo "$jam jam $menitjam menit $detikjam detik";
        fi
fi 
