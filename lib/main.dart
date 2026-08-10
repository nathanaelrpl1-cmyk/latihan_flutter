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
  
  List<Barang> daftarBarang = [bukutulis, pensil, penghapus];

  for (int i = 0; i <daftarBarang.length; i++) {
    daftarBarang[i].Tampilkan();
  }
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