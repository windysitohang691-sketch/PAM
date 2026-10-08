import 'package:flutter/material.dart';
import 'produk_list_page.dart';
import 'tambah_produk_page.dart';
import 'profil_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> {
  int _tabTerpilih = 0;
  int _jumlahKeranjang = 0;

  final List<Map<String, dynamic>> _produk = [
    {'nama': 'Kursi Minimalis', 'harga': 250000},
    {'nama': 'Meja Kerja Kayu', 'harga': 750000},
    {'nama': 'Lampu Meja LED', 'harga': 150000},
    {'nama': 'Rak Buku Minimalis', 'harga': 450000},
    {'nama': 'Lemari Pakaian', 'harga': 1200000},
  ];

  void _tambahProduk(Map<String, dynamic> produkBaru) {
    setState(() {
      _produk.add(produkBaru);
      _tabTerpilih = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${produkBaru['nama']} berhasil ditambahkan',
        ),
      ),
    );
  }

  void _hapusProduk(int index) {
    final namaProduk = _produk[index]['nama'];

    setState(() {
      _produk.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$namaProduk berhasil dihapus'),
      ),
    );
  }

  void _tambahKeranjang() {
    setState(() {
      _jumlahKeranjang++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabTerpilih,
        children: [
          ProdukListPage(
            produk: _produk,
            jumlahKeranjang: _jumlahKeranjang,
            onTambahKeranjang: _tambahKeranjang,
            onHapusProduk: _hapusProduk,
          ),
          TambahProdukPage(
            onTambahProduk: _tambahProduk,
          ),
          const ProfilPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _tabTerpilih = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Tambah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}