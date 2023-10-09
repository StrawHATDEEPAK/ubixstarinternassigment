import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_intern_assignment/provider.dart';
import 'package:ubixstar_intern_assignment/util.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetBoolProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        if (provider.getSaveButton &&
            !provider.getTextBox &&
            !provider.getImageBox) {
          showSnackBar(context, 'Add other widgets to save');
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 25,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.black),
        ),
        child: const Center(
            child: Text(
          'SAVE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
