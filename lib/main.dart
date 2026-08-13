
class Barang {
  String nama;
  double harga;
  int _stok;

  Barang ({
    required this.nama,
    required this.harga,
    required this._stok,
  });

  bool jual(int n) {
    if (n > 0 && _stok >= n) {
      _stok -= n;
      print("Transaksi Sukses. Berhasil menjual $n unit $nama. Sisa stok: $_stok");
      return true;
    } else {
      print("Transaksi gagal. Stok tidak mencukupi atau jumlah yang diminta tidak valid.");
      return false;
    }
  }
}

void prosesBeli(String inputJumlah, Barang barang) {
  print("Kasir menginput jumlah: '$inputJumlah'");

  try {
    int jumlah = int.parse(inputJumlah);
    barang.jual(jumlah);
  } catch (error) {
    print("Sepertinya input jumlah tidak valid. Harap massukan angka yang benar.");
  } finally {
    print("Transaksi dicatat di log.");
  }
}

void main() {
  Barang bukuTulis = Barang(nama: 'Buku Tulis', harga: 3000.0, stok: 100);
  Barang pensil = Barang(nama: 'Pensil', harga: 2000.0, stok: 50);

  prosesBeli("2", bukuTulis); 
  prosesBeli("dua", pensil);   
}