import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Container 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey,
            child: const Center(
              child: Text(
                'Container 2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}