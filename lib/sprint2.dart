import 'package:intl/intl.dart';

void main() {
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  
  String NamaBarang = "Buku Gambar A3";
  num HargaAnggota = 10000;
  num HargaUmum = 15000;
  int JumlahStok = 10;
  bool tersedia = JumlahStok > 0;
  int JumlahBeli = 3;
  bool anggota = false;
  num hargasatuan;

  String kategori = "atk";
  String lokasirak;

  switch (kategori) {
    case "atk":
      lokasirak = "rak 1";
      break;
    case "makanan":
      lokasirak = "rak 2";
      break;
    case "minuman":
      lokasirak = "rak 3";
      break;
    default:
      lokasirak = "rak lain";
  }
  // Mengapa switch lebih baik daripada if-else dalam kasus ini?
  // Karena switch lebih efisien dan lebih mudah dibaca ketika kita memiliki 
  // banyak kondisi yang harus diperiksa. Switch memungkinkan kita untuk memeriksa 
  // satu variabel terhadap banyak nilai yang berbeda tanpa harus menulis ulang 
  // nama variabel dan operator perbandingan di setiap baris, seperti yang terjadi pada if-else.


  if (anggota) {
    hargasatuan = HargaAnggota;
  } else {
    hargasatuan = HargaUmum;
  }

  num totalawal = hargasatuan * JumlahBeli;

  double persentasePotongan = 0.0;
  String keteranganPotongan = "0%";

  if (totalawal > 200000) {
    persentasePotongan = 0.10;
    keteranganPotongan = "10%";
  } else if (totalawal > 100000) {
    persentasePotongan = 0.05;
    keteranganPotongan = "5%";
  } else {
    persentasePotongan = 0.0;
    keteranganPotongan = "0%";
  }

  double nilaiPotongan = totalawal * persentasePotongan;
  double nilaiakhir = totalawal - nilaiPotongan;

  print("========= Kartu Anggota ==========");
  print("Nama Barang : $NamaBarang");
  print("Harga Anggota : ${formatRupiah.format(HargaAnggota)}");
  print("Harga Umum : ${formatRupiah.format(HargaUmum)}");
  print("Jumlah Stok : $JumlahStok");
  print("Lokasi Rak : $lokasirak");
  print("-----------------------------------------");

  if (tersedia) {
    print("Status Pembeli  : ${anggota ? 'Anggota' : 'Umum'}");
    print("Total Beli : $JumlahBeli");
    print("Total Belanja : ${formatRupiah.format(totalawal)}");
    print("-----------------------------------------");
    print("Potongan ($keteranganPotongan): ${formatRupiah.format(nilaiPotongan)}");
    print("Total Harga yang harus Dibayar : ${formatRupiah.format(nilaiakhir)}");
  } else {
    print("Maaf, barang tidak tersedia.");
  }
  print("=========================================");
}

// Pemilihan tipe data yang tepat sangat penting untuk mencegah 
// kesalahan perhitungan matematis pada sistem kasir koperasi. 
// Penggunaan tipe data angka seperti 'int' memastikan program 
// dapat melakukan operasi hitung (seperti perkalian total belanja). 
// Jika data seperti harga atau stok salah disimpan sebagai teks 
// (String), aplikasi tidak akan bisa memproses kalkulasi transaksi 
// secara otomatis dan memicu error.