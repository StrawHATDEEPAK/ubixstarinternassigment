import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_intern_assignment/screens/first_page.dart';
import 'package:ubixstar_intern_assignment/util.dart';
import 'package:ubixstar_intern_assignment/widgets/widget_select.dart';

import '../provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetBoolProvider>(context, listen: true);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectWidget(
                  title: 'TEXT BOX',
                  value: provider.getTextBox,
                ),
                SelectWidget(
                  title: 'IMAGE BOX',
                  value: provider.getImageBox,
                ),
                SelectWidget(
                  title: 'SAVE BUTTON',
                  value: provider.getSaveButton,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!provider.getImageBox &&
                  !provider.getSaveButton &&
                  !provider.getTextBox) {
                showSnackBar(context, 'Select atleast one widget');
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstPage(),
                    ));
              }
            },
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
