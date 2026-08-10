import 'package:intl/intl.dart';
class Barang {
  String nama;
  double harga;
  int stok;

  Barang ({
    required this.nama,
    required this.harga,
    required this.stok,
  });

  void Tampilkan() {
    final formatRupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 2,
    );

    print('=== BARANG KOPERASI ===');
    print('Nama Barang: $nama');
    print('harga: ${formatRupiah.format(harga)}');
    print('Stok: $stok');
    print('=======================');
  }
}

void main() {
  print('==== DAFTAR BARANG KOPERASI ====');

  Barang bukutulis = Barang(nama: 'Buku Tulis', harga: 3000.0, stok: 100);
  Barang pensil = Barang(nama: 'Pensil', harga: 1500.0, stok: 50);
  Barang penghapus = Barang(nama: 'Penghapus', harga: 1000.0, stok: 30);

  bukutulis.Tampilkan();
  pensil.Tampilkan();
  penghapus.Tampilkan();
}
