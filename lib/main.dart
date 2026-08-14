// 1. Tipe Data & Kontrol Alur: Menjamin akurasi hitungan uang dan 
//    mengotomatisasi penentuan diskon atau poin secara presisi.
// 2. OOP (Class/Objek): Membungkus data 'Barang' dan 'Pembeli' secara 
//    terstruktur, serta melindungi stok dari perubahan ilegal (enkapsulasi).
// 3. Modularitas (Fungsi): Memecah logika kompleks (seperti transaksi) 
//    ke fungsi terpisah agar mudah diperbarui di kemudian hari.
// 4. Error Handling (Try-Catch): Menghindari 'human error' (salah ketik) 
//    agar aplikasi tidak mati mendadak (crash) di tengah antrean.
// 5. Asinkron (Async/Await): Memastikan antarmuka kasir tidak crash
//    saat sistem sedang menarik atau menyimpan data ke server.

import 'package:intl/intl.dart';

class Pembeli {
  String nama;
  bool isAnggota;
  int poin; 

  Pembeli({
    required this.nama,
    required this.isAnggota,
    this.poin = 0, 
  });

  void tambahPoin(double totalBelanja) {
    if (isAnggota) {
      int poinDidapat = (totalBelanja / 10000).floor(); 
      
      if (poinDidapat > 0) {
        poin += poinDidapat;
        print("REWARD ANGGOTA: Mendapat $poinDidapat poin!");
        print("Total Poin '$nama' saat ini: $poin poin.");
      }
    }
  }
}

class Barang {
  String nama;
  double harga;
  int _stok; 

  Barang(this.nama, this.harga, int stok) : _stok = stok;
  int get stok => _stok;

  void jual(int n) {
    if (n > _stok) throw Exception("Stok tidak cukup!");
    _stok -= n;
  }
}

void prosesTransaksi(Barang barang, int jumlah, Pembeli pembeli) {
  final formatRupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  
  print("\n--- Transaksi: ${pembeli.nama} ---");
  
  try {
    barang.jual(jumlah);
    double totalHarga = barang.harga * jumlah;
    double diskon = 0.0;

    if (pembeli.isAnggota) {
      diskon = totalHarga * 0.10; 
    }
    
    double totalBayar = totalHarga - diskon;
    
    print("Membeli       : $jumlah x ${barang.nama}");
    print("Total Tagihan : ${formatRupiah.format(totalBayar)}");

    pembeli.tambahPoin(totalBayar);

  } catch (e) {
    print("Galat: $e");
  }
}

void main() {
  print("=== UJI COBA FITUR POIN BRANTAS MART ===");

  Barang seragam = Barang("Seragam Sekolah", 150000.0, 10);
  
  Pembeli siswaMember = Pembeli(nama: "Budi (Anggota)", isAnggota: true, poin: 5); 
  Pembeli siswaUmum = Pembeli(nama: "Andi (Umum)", isAnggota: false);

  prosesTransaksi(seragam, 1, siswaMember);

  prosesTransaksi(seragam, 1, siswaUmum);
}