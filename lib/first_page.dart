import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple,
            height: 100,
            width: 100,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Text('Import Widgets'),
          )
        ],
      ),
    );
  }
}
