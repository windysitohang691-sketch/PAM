import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produk_detail_page.dart';
import 'package:flutter_application_1/widget_basic/product_card.dart';

class ProdukListPage extends StatefulWidget {
  const ProdukListPage({super.key});

  @override
  State<ProdukListPage> createState() => _ProdukListPageState();
}

class _ProdukListPageState extends State<ProdukListPage> {
  final List<Map<String, dynamic>> _produk = [
    {
      'nama': 'Kursi Minimalis',
      'harga': 250000,
    },
    {
      'nama': 'Meja Kerja Kayu',
      'harga': 750000,
    },
    {
      'nama': 'Lampu Meja LED',
      'harga': 150000,
    },
    {
      'nama': 'Rak Buku Minimalis',
      'harga': 450000,
    },
    {
      'nama': 'Lemari Pakaian',
      'harga': 1200000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _produk.length,
        itemBuilder: (context, index) {
          final produk = _produk[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ProductCard(
              nama: produk['nama'],
              harga: produk['harga'],
              onTap: () async {
                final hasil = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProdukDetailPage(
                      namaProduk: produk['nama'],
                      harga: produk['harga'],
                    ),
                  ),
                );

                if (hasil != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Anda memilih: $hasil'),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}