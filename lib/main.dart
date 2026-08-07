import 'package:intl/intl.dart';

double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

double hitungDiskon(double total, double persenpotongan) {
  return total * persenpotongan / 100;
}

void main() {
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 2,
  );

  print("=== TRANSAKSI KOPERASI ===");
  String namaBarang = "Buku Tulis";
  int jumlahBeli = 85;
  double hargaSatuan = 3000.0;

  double totalBelanja = hitungTotal(jumlahBeli, hargaSatuan);

  double persenPotongan = 0.0;
  String keteranganPotongan = "0%";

  if (totalBelanja > 500000) {
    persenPotongan = 15.0;
    keteranganPotongan = "15%";
  } else if (totalBelanja > 200000) {
    persenPotongan = 10.0;
    keteranganPotongan = "10%";
  } else if (totalBelanja > 100000) {
    persenPotongan = 5.0;
    keteranganPotongan = "5%";
  } else {
    persenPotongan = 0.0;
    keteranganPotongan = "0%";
  }

  double Diskon = hitungDiskon(totalBelanja, persenPotongan);
  double hargaAkhir = totalBelanja - Diskon;

  print("Barang         : $namaBarang");
  print("Harga/pcs      : ${formatRupiah.format(hargaSatuan)}");
  print("Jumlah Beli    : $jumlahBeli pcs");
  print("----------------------------------");
  print("Total Awal     : ${formatRupiah.format(totalBelanja)}");
  print("Diskon (${persenPotongan.toInt()}%)   : -${formatRupiah.format(Diskon)}");
  print("----------------------------------");
  print("HARGA AKHIR    : ${formatRupiah.format(hargaAkhir)}");
  print("==================================");
}

// Jika kelak aturan atau rumus potongan diubah (misal dari persentase menjadi potongan nominal tetap), 
// Bagian yang cukup diubah sekali hanyalah rumus di dalam blok fungsi 'hitungDiskon', 
// dan seluruh kalkulasi transaksi di dalam sistem akan otomatis mengikuti pembaruan aturan tersebut.