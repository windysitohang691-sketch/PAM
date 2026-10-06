import 'package:flutter/material.dart';
import 'produk_list_page.dart';
import 'tambah_produk_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _tabTerpilih = 0;

  final List<Widget> _halaman = [
    const ProdukListPage(),
    const TambahProdukPage(),
    const Center(
      child: Text(
        'Halaman Profil',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _halaman[_tabTerpilih],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,

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