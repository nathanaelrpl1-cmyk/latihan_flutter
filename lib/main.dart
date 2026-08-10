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

  // double nilaiStok() {
  //   return harga * stok;
  // }

  bool bisaDijual(int diminta) {
    if (diminta <= stok) {
      return true;
    } else {
      return false;
    }
  }

  void kurangiStok(int diminta) {
    stok -= diminta;
  }

  // void Tampilkan() {
  //   final formatRupiah = NumberFormat.currency(
  //     locale: 'id_ID',
  //     symbol: 'Rp',
  //     decimalDigits: 2,
  //   );
  //   print("- $nama (Stok: $stok) -> Nilai Aset: ${formatRupiah.format(nilaiStok())}");
  // }
}

class Pembeli {
  String nama;
  bool statusanggota;

  Pembeli({
    required this.nama,
    required this.statusanggota,
  });
}

void main() {
  final formatRupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 2,
    );
  print('==== Transaksi Koperasi ====');

  Barang bukutulis = Barang(nama: 'Buku Tulis', harga: 3000.0, stok: 100);
  Pembeli siswa1 = Pembeli(nama: "Budi", statusanggota: true);  
  Pembeli siswa2 = Pembeli(nama: "Andi", statusanggota: false);

  int Jumlahpermintaan = 80;

  print("=== CEK KETERSEDIAAN BARANG ===");
  print("Barang       : ${bukutulis.nama}");
  print("Sisa Stok    : ${bukutulis.stok} pcs");
  print("Jumlah Beli  : ${Jumlahpermintaan} pcs");
  print("-------------------------------");

  if (bukutulis.bisaDijual(Jumlahpermintaan)) {
    double totalHarga = bukutulis.harga * Jumlahpermintaan;
    if (siswa1.statusanggota) {
      print("Status: ANGGOTA (Mendapat diskon 10%)");
      totalHarga = totalHarga - (totalHarga * 10 / 100);
    } else {
      print("Status: UMUM (Tidak mendapat diskon)");
    }

    bukutulis.kurangiStok(Jumlahpermintaan);

    print("Barang dibeli : ${bukutulis.nama} ($Jumlahpermintaan pcs)");
    print("Total Bayar   : Rp${formatRupiah.format(totalHarga)}");
  }
  print("===================================");
  
  // List<Barang> daftarBarang = [bukutulis, pensil, penghapus];

  // double TotalKeseluruhan = 0.0;

  // for (int i = 0; i <daftarBarang.length; i++) {
  //   daftarBarang[i].Tampilkan();

  //   TotalKeseluruhan += daftarBarang[i].nilaiStok();
  // }
  // print('Total Nilai Aset: ${formatRupiah.format(TotalKeseluruhan)}');
}

// Menyimpan objek ke dalam List<Barang> lalu menampilkannya dengan perulangan jauh lebih baik karena 
// membuat program sangat fleksibel dan otomatis saat jumlah data bertambah banyak. Jika tanpa perulangan 
// akan membuat harus memanggil perintah tampilkan() satu per satu secara manual untuk setiap barang, dengan
// cara ini hanya cukup menulis satu blok perulangan saja. Bayangkan jika nantinya koperasi memiliki ratusan jenis
// barang, jadi tidak perlu repot mengetik ratusan baris kode baru, karena perulangan akan otomatis mendata 
// dan mencetak seluruh isi daftar tersebut secara cepat tanpa ada satupun yang terlewat.
// --------------------------------------------------------------------------------------------------------
// Apa keuntungan memodelkan barang sebagai objek bagi pengembangan sistem 
// koperasi ke depan?
// Memodelkan barang sebagai objek membuat sistem jauh lebih mudah dikembangkan. Jika di suatu saat 
// koperasi ingin menambahkan detail baru (misalnya atribut "tanggal kedaluwarsa", "kategori", 
// atau method "cek kelayakan"), kita hanya perlu menambahkannya di dalam struktur 
// Kelas 'Barang' satu kali saja tanpa harus membongkar dan merombak seluruh 
// logika transaksi di program utama.
// --------------------------------------------------------------------------------------------------------
// JAWABAN ANALISA: 
// Untuk apa angka nilaiStok() ini berguna bagi laporan aset koperasi?
// Angka ini sangat berguna karena menunjukkan total uang/modal dalam bentuk barang  
// fisik. Pengurus koperasi wajib mengetahui angka ini untuk 
// menghitung kekayaan (aset) bersih koperasi saat ini, memantau perputaran modal, dan 
// sebagai data utama untuk pembukuan atau keuangan (neraca) di akhir bulan/tahun.