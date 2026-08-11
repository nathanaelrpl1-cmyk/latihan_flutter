import 'package:intl/intl.dart';

class Barang {
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 2,
  ); 

  String nama;
  double harga;
  int _stok;

  Barang(this.nama, this.harga, this._stok);

  int get stok => _stok;

  bool jual(int n) {
    if (n > 0 && _stok >= n) {
      _stok -= n;
      return true;
    } else {
      print("Stok tidak mencukupi atau jumlah yang diminta tidak valid.");
      return false;
    }
  }

  void tampilkan() {
    print("- $nama: ${formatRupiah.format(harga)} (Stok: $_stok)");
  }
}

class BarangPromo extends Barang {
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 2,
  );

  double Diskon;

  BarangPromo(String nama, double harga, int stok, this.Diskon) 
      : super(nama, harga, stok);

  double HargaPromo() {
    return harga - (harga * Diskon / 100);
  }
}

void main() {
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 2,
  );

  BarangPromo Buku = BarangPromo("Buku", 50000.0, 20, 10.0);

  int jumlahbeli = 15;
  
  print("=== Struk Belanja ===\n");
  print("Nama Barang : ${Buku.nama}");
  print("Stok Barang : ${Buku.stok}");
  if (Buku.jual(jumlahbeli)) {
    print("Harga Asli  : Rp${Buku.harga}");
    print("Diskon      : ${Buku.Diskon}%");
    print("------------------------------");
    print("jumlah beli : $jumlahbeli");
    print("Sisa stok  : ${Buku.stok}");
    print("HARGA PROMO : Rp${Buku.HargaPromo()}");  

    double totalHarga = Buku.HargaPromo() * jumlahbeli;
    print("Total Harga : ${formatRupiah.format(totalHarga)}");
  }
  print("==============================");
}

// Karena untuk mencegah manipulasi data secara langsung dari luar kelas. Jika stok 
// tidak dilindungi, programmer lain bisa saja tidak sengaja ataupun dengan sengaja 
// mengetik kode seperti `buku._stok = -50;` tanpa lewat proses transaksi. 
// Akibatnya, data di aplikasi menjadi kacau dan tidak sesuai dengan barang
// yang ada di gudang. Dengan melindunginya, kita memaksa setiap perubahan stok 
// harus melewati sebuah transaksi yang sudah dilengkapi dengan aturan validasi,
// sehingga data tetap aman.
