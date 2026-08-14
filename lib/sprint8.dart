import 'dart:async';

class Barang {
  String nama;
  double harga;
  int _stok; 

  Barang({
    required this.nama,
    required this.harga,
    required this._stok,
  });

  void jual(int n) {
    if (n > _stok) {
      throw Exception("Stok '$nama' tidak mencukupi! Sisa stok hanya $_stok unit.");
    }
    _stok -= n;
    print("Transaksi Sukses: Berhasil menjual $n unit $nama. Sisa stok: $_stok");
  }
}

void prosesBeli(String inputJumlah, Barang barang) {
  print("Kasir menginput jumlah: '$inputJumlah'");

  try {
    int jumlah = int.parse(inputJumlah);
    barang.jual(jumlah);
  } on FormatException catch (_) {
    print("Kesalahan Ketik: '$inputJumlah' bukan angka yang valid. Harap masukkan angka (contoh: 2)");
  } catch (error) {
    String pesanError = error.toString().replaceAll("Exception: ", "");
    print("Kesalahan Transaksi: $pesanError");
  } finally {
    print("Sistem: Transaksi dicatat di log.\n");
  }
}

Future<void> muatLaporan() async {
  print("Menyiapkan laporan akhir hari ... ");
  
  await Future.delayed(Duration(seconds: 2));
  
  print("Laporan siap! Data berhasil disimpan dengan aman.");
}

void main() async {
  Barang bukuTulis = Barang(nama: 'Buku Tulis', harga: 3000.0, stok: 100);
  Barang pensil = Barang(nama: 'Pensil', harga: 2000.0, stok: 50);

  prosesBeli("2", bukuTulis); 
  
  prosesBeli("dua", pensil);   
  
  prosesBeli("55", pensil);
  
  await muatLaporan();
  
  print("\nSemua proses selesai. Selamat beristirahat!");
}