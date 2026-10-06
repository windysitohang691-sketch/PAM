import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 185 / 243,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        padding: const EdgeInsets.all(16),
        children: List.generate(
          6,
          (index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
      ),
    );
  }
}