void main() {
  String NamaBarang = "Buku Gambar A3";
  int HargaAnggota = 15000;
  int HargaUmum = 20000;
  int JumlahStok = 10;
  bool StatusStok = true;
  int JumlahBeli = 3;

  int TotalAnggota = HargaAnggota * JumlahBeli;
  int TotalUmum = HargaUmum * JumlahBeli;

  int selisihHarga = TotalUmum - TotalAnggota;

  print("==== Kartu Anggota =====");
  print("Nama Barang : $NamaBarang");
  print("Harga Anggota : Rp$HargaAnggota");
  print("Harga Umum : Rp$HargaUmum");
  print("Jumlah Stok : $JumlahStok");
  print("Sedang Tersedia : $StatusStok");
  print("HargaTotal Anggota : Rp$TotalAnggota");
  print("HargaTotal Umum : Rp$TotalUmum");
  print("Selisih Harga : Rp$selisihHarga");
  print("==================================");
  }
  
// Pemilihan tipe data yang tepat sangat penting untuk mencegah 
// kesalahan perhitungan matematis pada sistem kasir koperasi. 
// Penggunaan tipe data angka seperti 'int' memastikan program 
// dapat melakukan operasi hitung (seperti perkalian total belanja). 
// Jika data seperti harga atau stok salah disimpan sebagai teks 
// (String), aplikasi tidak akan bisa memproses kalkulasi transaksi 
// secara otomatis dan memicu error.



