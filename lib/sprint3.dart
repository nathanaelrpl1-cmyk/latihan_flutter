import 'package:intl/intl.dart';

void main() {
  // Pemformatan Mata Uang Rupiah
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );

  List<String> daftarNamaBarang = [
    "Buku Gambar A3",
    "Pensil 2B",
    "Penghapus",
    "Spidol Permanent"
  ];
  
  List<num> daftarHarga = [
    10000,
    5000,
    3000,
    15000
  ];

  List<int> daftarStok = [
    5,
    10,
    8,
    3
  ];

  print("====== Daftar Stok menipis (< 5 pcs) ======");

  bool adastokmenipis = false;

  for (int i = 0; i < daftarNamaBarang.length; i++) {

    if (daftarStok[i] < 5) {
      adastokmenipis = true;
      print("- ${daftarNamaBarang[i]} (Sisa Stok: ${daftarStok[i]} pcs)");
    }
  }

  if (adastokmenipis == false) {
    print("Tidak ada barang dengan stok menipis.");
  }
  print("===========================================");

  double totalaset = 0;

  print("=== DAFTAR BARANG ===");
  for (int i = 0; i < daftarNamaBarang.length; i++) {

    String nama = daftarNamaBarang[i];
    num harga = daftarHarga[i];
    int stok = daftarStok[i];
    
    num subtotalaset = harga * stok;

    totalaset += subtotalaset;

    print("${i + 1}. $nama ($stok pcs) = ${formatRupiah.format(subtotalaset)}");
  }
  print("----------------------------------");
  print("TOTAL NILAI KESELURUHAN : ${formatRupiah.format(totalaset)}");
  print("==================================");
  // String NamaBarang = "Buku Gambar A3";
  // num HargaAnggota = 10000;
  // num HargaUmum = 15000;
  int JumlahStok = 5;
  // bool tersedia = JumlahStok > 0;   
  // int JumlahBeli = 50;
  // bool beli = JumlahBeli <= JumlahStok && JumlahBeli > 0;
  // bool anggota = true;
  // num hargasatuan;

  print("====== Penjualan Penghapus ======");
  while (JumlahStok > 0) {
    JumlahStok--;
    print("Terjual 1 barang, sisa stok: $JumlahStok");
    // BAHAYA KONDISI WHILE KELIRU:
    // Jika kondisi berhenti pada perulangan 'while' keliru (misalnya lupa mengurangi stok atau menggunakan syarat yang selalu benar), 
    // akan terjadi 'infinite loop' (perulangan tanpa henti) yang dapat menyebabkan aplikasi 'freeze'/crash, 
    // serta potensi stok menjadi minus (negatif) sehingga mencetak data transaksi palsu. 
    // CARA MEMASTIKAN TIDAK MENJUAL MELEBIHI STOK:
    // 1. Memastikan kondisi batas perulangan/validasi tepat, yaitu 'stok > 0'.
    // 2. Selalu mengurangi nilai stok ('stok--') di dalam blok proses penjualan.
  }

  // String kategori = "atk";
  // String lokasirak;

  // switch (kategori) {
  //   case "atk":
  //     lokasirak = "rak 1";
  //     break;
  //   case "makanan":
  //     lokasirak = "rak 2";
  //     break;
  //   case "minuman":
  //     lokasirak = "rak 3";
  //     break;
  //   default:
  //     lokasirak = "rak lain";
  // }
  // // Mengapa switch lebih baik daripada if-else dalam kasus ini?
  // // Karena switch lebih efisien dan lebih mudah dibaca ketika kita memiliki 
  // // banyak kondisi yang harus diperiksa. Switch memungkinkan kita untuk memeriksa 
  // // satu variabel terhadap banyak nilai yang berbeda tanpa harus menulis ulang 
  // // nama variabel dan operator perbandingan di setiap baris, seperti yang terjadi pada if-else.


  // if (anggota) {
  //   hargasatuan = HargaAnggota;
  // } else {
  //   hargasatuan = HargaUmum;
  // }

  // num totalawal = hargasatuan * JumlahBeli;

  // double persentasePotongan = 0.0;
  // String keteranganPotongan = "0%";
  
  // if (totalawal > 100000) {
  //   persentasePotongan = 0.05;
  //   keteranganPotongan = "5%";
  // } else if (totalawal > 200000) {
  //   persentasePotongan = 0.10;
  //   keteranganPotongan = "10%";
  // } else if (totalawal > 500000) {
  //   persentasePotongan = 0.15;
  //   keteranganPotongan = "15%";
  // } else {
  //   persentasePotongan = 0.0;
  //   keteranganPotongan = "0%";
  // }

  // double nilaiPotongan = totalawal * persentasePotongan;
  // double nilaiakhir = totalawal - nilaiPotongan;

  // print("========= Kartu Anggota ==========");
  // print("Nama Barang : $NamaBarang");
  // print("Harga Anggota : ${formatRupiah.format(HargaAnggota)}");
  // print("Harga Umum : ${formatRupiah.format(HargaUmum)}");
  // print("Jumlah Stok : $JumlahStok");
  // print("Lokasi Rak : $lokasirak");
  // print("-----------------------------------------");

  // if (tersedia && beli) {
  //   print("Status Pembeli  : ${anggota ? 'Anggota' : 'Umum'}");
  //   print("Total Beli : $JumlahBeli");
  //   print("Total Belanja : ${formatRupiah.format(totalawal)}");
  //   print("-----------------------------------------");
  //   print("Potongan ($keteranganPotongan): ${formatRupiah.format(nilaiPotongan)}");
  //   print("Total Harga yang harus Dibayar : ${formatRupiah.format(nilaiakhir)}");
  // } else {
  //   print("Maaf, barang tidak tersedia/input tidak valid.");
  // }
  // print("=========================================");
}

// Pemilihan tipe data yang tepat sangat penting untuk mencegah 
// kesalahan perhitungan matematis pada sistem kasir koperasi. 
// Penggunaan tipe data angka seperti 'int' memastikan program 
// dapat melakukan operasi hitung (seperti perkalian total belanja). 
// Jika data seperti harga atau stok salah disimpan sebagai teks 
// (String), aplikasi tidak akan bisa memproses kalkulasi transaksi 
// secara otomatis dan memicu error.