@startuml penjualan

actor Kasir

actor Pemilik

usecase "Tambah Penjualan" as UC1

usecase "Lihat Penjualan" as UC2

usecase "Edit Penjualan" as UC3

usecase "Hapus Penjualan" as UC4

usecase "Lihat Laporan Penjualan" as UC5

Kasir --> UC1

Kasir--> UC2

Kasir--> UC3

Kasir--> UC4

Pemilik --> UC5

@enduml




@startuml
class Penjualan {
  id_penjualan: int
  tanggal: Date
  total_harga: double
  + tambahPenjualan()
  + lihatPenjualan()
  + editPenjualan()
  + hapusPenjualan()
}

class Barang {
  id_barang: int
  nama_barang: String
  harga_satuan: double
  stok: int
  + updateStok()
}

class Pelanggan {
  id_pelanggan: int
  nama_pelanggan: String
  no_hp: String
}

Penjualan "1" *-- "1..*" Barang : berisi
Penjualan "1" o-- "1" Pelanggan : dimiliki oleh
@enduml





@startuml
actor Kasir

Kasir -> PenjualanController: tambahPenjualan(data_penjualan)
PenjualanController -> Barang: cekStok(data_barang)
Barang --> PenjualanController: stok_tersedia
PenjualanController -> Penjualan: simpan(data_penjualan)
Penjualan --> Kasir: notifikasi "Berhasil Menambahkan Penjualan"

@enduml



@startuml
start

:Input data penjualan;
:Periksa stok barang;

if (Stok cukup?) then (Ya)
  :Simpan data penjualan;
  :Update stok barang;
else (Tidak)
  :Tampilkan pesan "Stok Tidak Cukup";
endif

stop
@enduml