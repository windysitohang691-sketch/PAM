import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
const ProfilPage({super.key});

@override
Widget build(BuildContext context) {
final menuProfil = [
{'judul': 'Profil Saya', 'ikon': Icons.person_outline},
{'judul': 'Pesanan', 'ikon': Icons.shopping_bag_outlined},
{'judul': 'Favorit', 'ikon': Icons.favorite_border},
{'judul': 'Keranjang', 'ikon': Icons.shopping_cart_outlined},
{'judul': 'Notifikasi', 'ikon': Icons.notifications_none},
{'judul': 'Bantuan', 'ikon': Icons.help_outline},
];


return Scaffold(
  backgroundColor: const Color(0xFFF7F7FB),
  appBar: AppBar(
    title: const Text('Profil'),
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
  ),
  body: ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengguna Minimal Store',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Selamat datang!',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      const Text(
        'Menu Akun',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      ...menuProfil.map((menu) {
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(
              menu['ikon'] as IconData,
              color: Colors.deepPurple,
              size: 28,
            ),
            title: Text(menu['judul'] as String),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text(menu['judul'] as String),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            menu['ikon'] as IconData,
                            size: 70,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            menu['judul'] as String,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () =>
                                Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Kembali'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
      const SizedBox(height: 12),
      const Center(child: Text('Minimal Store')),
    ],
  ),
);


}
}
