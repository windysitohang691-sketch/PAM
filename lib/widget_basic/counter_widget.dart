import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _jumlah = 0;

  void _tambah() {
    setState(() {
      _jumlah++;
    });
  }

  void _kurang() {
    if (_jumlah > 0) {
      setState(() {
        _jumlah--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jumlah: $_jumlah',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _kurang,
                  icon: const Icon(Icons.remove),
                  iconSize: 40,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: _tambah,
                  icon: const Icon(Icons.add),
                  iconSize: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}