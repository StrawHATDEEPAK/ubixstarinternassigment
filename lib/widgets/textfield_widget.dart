import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_intern_assignment/provider.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    atStart();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void atStart() {
    final provider = Provider.of<WidgetBoolProvider>(context, listen: false);
    _controller.text = provider.getDataModel.text;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetBoolProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) => provider.setTextBoxValue(value),
        decoration: const InputDecoration(
          hintText: "Enter Text",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
