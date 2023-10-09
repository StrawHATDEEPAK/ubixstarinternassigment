import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_intern_assignment/provider.dart';
import 'package:ubixstar_intern_assignment/screens/second_page.dart';
import 'package:ubixstar_intern_assignment/services/firebase_services.dart';
import 'package:ubixstar_intern_assignment/widgets/image_box.dart';
import 'package:ubixstar_intern_assignment/widgets/save_button_widget.dart';
import 'package:ubixstar_intern_assignment/widgets/textfield_widget.dart';
import 'dart:developer' as dev;

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final firebaseServices = FirebaseServices();
  @override
  void initState() {
    dev.log('initState', name: 'FirstPage');
    firebaseServices.getData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetBoolProvider>(context, listen: true);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Assignment App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    provider.getTextBox
                        ? const TextFieldWidget()
                        : const SizedBox(),
                    provider.getImageBox ? const ImageBox() : const SizedBox(),
                    provider.getSaveButton
                        ? SaveButtonWidget()
                        : const SizedBox(),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ));
                },
                child: const Text('Import Widgets'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
