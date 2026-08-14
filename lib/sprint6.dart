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

  @override
  void tampilkan() {
    print("- $nama [PROMO ${Diskon.toInt()}%]");
    print(" Harga: ${formatRupiah.format(harga)} Menjadi ${formatRupiah.format(HargaPromo())} (Stok: $stok)");
  }
}

class BarangGrosir extends Barang {
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 2,
  );

  int jumlahMinimum;
  double hargaGrosir;
  int diminta;

  BarangGrosir(String nama, double harga, int stok, this.diminta, this.jumlahMinimum, this.hargaGrosir) 
      : super(nama, harga, stok);

  double HargaGrosir() {
    return harga - (harga * hargaGrosir / 100);
  }
  @override
  void tampilkan() {
    print("- $nama [GROSIR ${hargaGrosir.toInt()}%]");
    print(" Harga: ${formatRupiah.format(harga)} Menjadi ${formatRupiah.format(HargaGrosir())} (Stok: $stok)");
    print(" Minimum pembelian untuk mendapatkan diskon grosir: $jumlahMinimum");
  }
}

void main() {
  Barang pensil = Barang("Pensil", 2000.0, 20);
  pensil._stok = 80;
  BarangPromo Buku = BarangPromo("Buku", 50000.0, 20, 10.0);
  BarangGrosir Komputer = BarangGrosir("Komputer", 1000000.0, 10, 4, 5, 15.0);

  pensil.tampilkan();
  print("=================================");
  Buku.tampilkan();
  print("=================================");
  Komputer.tampilkan();
}