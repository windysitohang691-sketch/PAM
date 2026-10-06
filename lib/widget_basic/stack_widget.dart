import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      body: Center(
        child: Stack(
          children: [
            const Icon(
              Icons.shopping_cart,
              size: 50,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}