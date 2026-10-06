class Barang {
  int id;
  String nama;
  int jumlah;
  double harga;

  Barang(this.id, this.nama, this.jumlah, this.harga);

  double get totalHarga => jumlah * harga;

  @override
  String toString() {
    return 'ID: $id, Nama: $nama, Jumlah: $jumlah, Harga: $harga, Total: $totalHarga';
  }
}

class Inventaris {
  List<Barang> _barangList = [];
  int _nextId = 1;

  void tambahBarang(String nama, int jumlah, double harga) {
    var barang = Barang(_nextId++, nama, jumlah, harga);
    _barangList.add(barang);
    print('Barang berhasil ditambahkan: $barang');
  }

  void hapusBarang(int id) {
    _barangList.removeWhere((barang) => barang.id == id);
    print('Barang dengan ID $id telah dihapus.');
  }

  void tampilkanBarang() {
    if (_barangList.isEmpty) {
      print('Tidak ada barang dalam inventaris.');
    } else {
      print('Daftar Barang dalam Inventaris:');
      _barangList.forEach((barang) => print(barang));
    }
  }

  void cariBarang(String nama) {
    var foundItems = _barangList.where(
      (barang) => barang.nama.toLowerCase().contains(nama.toLowerCase()));

    if (foundItems.isEmpty) {
      print('Barang dengan nama "$nama" tidak ditemukan.');
    } else {
      print('Hasil Pencarian untuk nama "$nama":');
      foundItems.forEach((barang) => print(barang));
    }
  }


  void updateBarang(
    int id, {
    String? nama,
    int? jumlah,
    double? harga,
  }) {
    var foundItems = _barangList.where((barang) => barang.id == id);

    if (foundItems.isEmpty) {
      print('Barang dengan ID $id tidak ditemukan.');
      return;
    }

    var barang = foundItems.first;

    if (nama != null) {
      barang.nama = nama;
    }

    if (jumlah != null) {
      barang.jumlah = jumlah;
    }

    if (harga != null) {
      barang.harga = harga;
    }

    print('Barang dengan ID $id berhasil diperbarui: $barang');
  }

  
  double totalNilaiInventaris() {
    return _barangList.fold(0, (total, barang) => total + barang.totalHarga);
  }

  void generateReport() {
    print('=== Laporan Inventaris ===');
    print('Jumlah total jenis barang : ${_barangList.length}');
    print('Total nilai inventaris : ${totalNilaiInventaris()}');
    print('==========================');
  }
}

void main() {
  var inventaris = Inventaris();

  // Tambahkan beberapa barang
  inventaris.tambahBarang("Laptop", 5, 15000000);
  inventaris.tambahBarang("Mouse", 10, 200000);
  inventaris.tambahBarang("Keyboard", 7, 500000);

  // Tampilkan semua barang
  inventaris.tampilkanBarang();

  // Cari barang
  inventaris.cariBarang("Mouse");

  // Hapus barang dengan ID 2
  inventaris.hapusBarang(2);

  // Tampilkan kembali daftar barang
  inventaris.tampilkanBarang();

   // Tampilkan total nilai inventaris
  print('Total nilai inventaris: ${inventaris.totalNilaiInventaris()}');

  // Perbarui harga Laptop
  inventaris.updateBarang(1, harga: 16000000);


  // Tampilkan daftar setelah pembaruan
  inventaris.tampilkanBarang();

  // Cetak laporan inventaris
  inventaris.generateReport();
}