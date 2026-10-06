import 'package:flutter/material.dart';

class TambahProdukPage extends StatefulWidget {
  const TambahProdukPage({super.key});

  @override
  State<TambahProdukPage> createState() => _TambahProdukPageState();
}

class _TambahProdukPageState extends State<TambahProdukPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void _tambahProduk() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Produk ${_namaController.text} berhasil ditambahkan',
          ),
        ),
      );

      _namaController.clear();
      _hargaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.shopping_bag),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama produk wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Harga Produk',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga produk wajib diisi';
                  }

                  final harga = int.tryParse(value);

                  if (harga == null) {
                    return 'Harga harus berupa angka';
                  }

                  if (harga <= 0) {
                    return 'Harga harus lebih dari 0';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _tambahProduk,
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah Produk'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}