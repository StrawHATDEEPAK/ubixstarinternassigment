import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class SelectWidget extends StatefulWidget {
  final String title;
  final bool value;
  const SelectWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    value = widget.value;
    final provider = Provider.of<WidgetBoolProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                value = !value;
              });
              if (widget.title == 'TEXT BOX') {
                provider.setTextBox(value);
              }
              if (widget.title == 'IMAGE BOX') {
                provider.setImageBox(value);
              }
              if (widget.title == 'SAVE BUTTON') {
                provider.setSaveButton(value);
              }
            },
            child: Container(
              color: Colors.grey[400],
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: value ? Colors.purple[100] : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.grey[200],
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
