import 'package:flutter/material.dart';
import '../widget_basic/product_card.dart';
import 'produk_detail_page.dart';

class ProdukListPage extends StatelessWidget {
  final List<Map<String, dynamic>> produk;
  final int jumlahKeranjang;
  final VoidCallback onTambahKeranjang;
  final void Function(int index) onHapusProduk;

  const ProdukListPage({
    super.key,
    required this.produk,
    required this.jumlahKeranjang,
    required this.onTambahKeranjang,
    required this.onHapusProduk,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 28,
                ),
                if (jumlahKeranjang > 0)
                  Positioned(
                    right: -9,
                    top: -8,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$jumlahKeranjang',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: produk.isEmpty
          ? const Center(
              child: Text('Belum ada produk. Tambahkan produk baru.'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: produk.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 210,
              ),
              itemBuilder: (context, index) {
                final item = produk[index];

                return ProductCard(
                  produk: item,
                  onTap: () async {
                    final hasil = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdukDetailPage(
                          namaProduk: item['nama'] as String,
                          harga: item['harga'] as int,
                        ),
                      ),
                    );

                    if (hasil == true && context.mounted) {
                      onTambahKeranjang();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${item['nama']} berhasil ditambahkan ke keranjang',
                          ),
                        ),
                      );
                    }
                  },
                  onHapus: () {
                    showDialog<void>(
                      context: context,
                      builder: (dialogContext) {
                        return AlertDialog(
                          title: const Text('Hapus Produk'),
                          content: Text(
                            'Yakin ingin menghapus ${item['nama']}?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                              child: const Text('Batal'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                onHapusProduk(index);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Hapus'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}