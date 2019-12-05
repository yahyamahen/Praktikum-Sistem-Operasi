from os import getpid
from time import time, sleep
from multiprocessing import Pool, Process

def pangkat(angka):
    global angka_pangkat

    if angka%angka_pangkat == 0:
        print(angka**2, "ID Proses", getpid())
    else:
        print(angka, "ID Proses", getpid())
    sleep(1)

if __name__ == '__main__':
    print("Masukkan Dua Angka ")
    angka_pangkat = int(input())    
    angka = int(input())
    
    # PEMROSESAN SEKUENSIAL
    print("\nPemrosesan Sekuensial")
    sekuensial_awal = time()
    
    for i in range(1, angka**2+1):
      pangkat(i)
    
    sekuensial_akhir= time()
    
    # PEMROSESAN PARALEL DENGAN multiprocessing.process
    print("\nPemrosesan Paralel dengan multiprocessing.process")
    kumpulan_proses = []
    
    process_awal = time()
    
    for i in range(1,angka**2+1):
      p = Process(target=pangkat, args=(i,))
      kumpulan_proses.append(p)
      p.start()
    
    for i in kumpulan_proses:
      p.join()
    
    process_akhir = time()
    
    # PEMROSESAN PARALEL DENGAN multiprocessing.pool
    print("\nPemrosesan Paralel dengan multiprocessing.pool")
    pool_awal = time()
    
    pool = Pool()
    pool.map(pangkat, range(1,angka**2+1))
    pool.close()
    
    pool_akhir = time()
    
print("Sekuensial", sekuensial_akhir-sekuensial_awal, "detik")
print("Multiprocessing.process", process_akhir-process_awal, "detik")
print("Multiprocessing.pool", pool_akhir-pool_awal, "detik")
