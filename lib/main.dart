import 'dart:async';
import 'package:intl/intl.dart';

class Pembeli {
  String nama;
  bool isAnggota;

  Pembeli({
    required this.nama,
    required this.isAnggota,
  });
}

class Barang {
  String nama;
  double harga;
  int _stok; 

  Barang({
    required this.nama,
    required this.harga,
    required this._stok,
  });

  int get stok => _stok;

  void jual(int n) {
    if (n <= 0) {
      throw Exception("Jumlah pembelian harus lebih dari 0!");
    }
    if (n > _stok) {
      throw Exception("Stok '$nama' tidak mencukupi! Sisa stok hanya $_stok unit.");
    }
    _stok -= n;
  }
}

Future<void> memuat() async {
  print("Sedang memuat ...");
  await Future.delayed(Duration(seconds: 3));
  print("Sistem siap!\n");
}

Future<void> simpanLaporan() async {
  print("\nMenyimpan laporan transaksi ...");
  await Future.delayed(Duration(seconds: 2));
  print("Laporan siap! Data berhasil disimpan. Terimakasih!");
}

void prosesTransaksi(String inputJumlah, Barang barang, Pembeli pembeli) {
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID', 
    symbol: 'Rp', 
    decimalDigits: 0
  );
  
  print("\n--- Kasir memproses pesanan: ${pembeli.nama} ---");
  print("Input jumlah barang: '$inputJumlah' untuk ${barang.nama}");

  try {
    int jumlah = int.parse(inputJumlah);

    barang.jual(jumlah);

    double totalHarga = barang.harga * jumlah;
    double diskon = 0.0;

    if (pembeli.isAnggota) {
      diskon = totalHarga * 0.10;
      print("Status: ANGGOTA (Mendapat diskon 10%)");
    } else {
      print("Status: UMUM (Tidak mendapat diskon)");
    }

    double totalBayar = totalHarga - diskon;

    print("TRANSAKSI SUKSES!");
    print("Rincian Pembelian  : $jumlah x ${formatRupiah.format(barang.harga)}");
    print("Total Awal         : ${formatRupiah.format(totalHarga)}");
    print("Potongan           : -${formatRupiah.format(diskon)}");
    print("Sisa Stok          : ${barang.stok}");
    print("Total Tagihan      : ${formatRupiah.format(totalBayar)}");

  } on FormatException catch (_) {
    print("Kesalahan Ketik: '$inputJumlah' bukan angka yang valid. Harap masukkan angka (contoh: 2)");
  } catch (error) {
    String pesanError = error.toString().replaceAll("Exception: ", "");
    print("Kesalahan Transaksi: $pesanError");
  } finally {
    print("Sistem: Transaksi dicatat di log.");
  }
}

// 5. ALUR PROGRAM UTAMA (Main)
void main() async {
  final formatRupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  
  print("=== SISTEM KASIR BRANTAS MART ===\n");

  await memuat();

  List<Barang> daftarBarang = [
    Barang(nama: 'Buku Tulis', harga: 5000.0, stok: 20),
    Barang(nama: 'Pensil', harga: 2000.0, stok: 15),
    Barang(nama: 'Penghapus', harga: 1500.0, stok: 50),
  ];

  Pembeli pelanggan1 = Pembeli(nama: "Budi", isAnggota: true);
  Pembeli pelanggan2 = Pembeli(nama: "Andi", isAnggota: false);

  print("--- KATALOG BARANG HARI INI ---");
  for (int i = 0; i < daftarBarang.length; i++) {
    print("${i + 1}. ${daftarBarang[i].nama} - ${formatRupiah.format(daftarBarang[i].harga)} (Stok: ${daftarBarang[i].stok})");
  }

  prosesTransaksi("2", daftarBarang[0], pelanggan1);

  prosesTransaksi("tiga", daftarBarang[1], pelanggan2);

  prosesTransaksi("100", daftarBarang[2], pelanggan2);

  await simpanLaporan();
  print("Semua proses telah selesai. Terimakasih!");
}