import 'package:flutter/material.dart';

class ProdukDetailPage extends StatefulWidget {
  final String namaProduk;
  final int harga;

  const ProdukDetailPage({
    super.key,
    required this.namaProduk,
    required this.harga,
  });

  @override
  State<ProdukDetailPage> createState() => _ProdukDetailPageState();
}

class _ProdukDetailPageState extends State<ProdukDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.shopping_bag,
                size: 100,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.namaProduk,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Rp ${widget.harga}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.namaProduk} ditambahkan ke keranjang',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}