import 'package:flutter/material.dart';
import 'package:ubixstar_intern_assignment/widgets/widget_select.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectWidget(
                  title: 'TEXT BOX',
                ),
                SelectWidget(
                  title: 'IMAGE BOX',
                ),
                SelectWidget(
                  title: 'SAVE BUTTON',
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
