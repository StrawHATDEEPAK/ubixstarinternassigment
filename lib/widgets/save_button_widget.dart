import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_intern_assignment/provider.dart';
import 'package:ubixstar_intern_assignment/services/firebase_services.dart';
import 'package:ubixstar_intern_assignment/util.dart';

class SaveButtonWidget extends StatelessWidget {
  SaveButtonWidget({super.key});
  FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetBoolProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        if (provider.getSaveButton &&
            !provider.getTextBox &&
            !provider.getImageBox) {
          showSnackBar(context, 'Add other widgets to save');
        } else if (provider.getImageBox &&
            provider.getSaveButton &&
            provider.getTextBox) {
          if (provider.getImageBoxValue == null &&
              provider.getTextBoxValue.isEmpty) {
            showSnackBar(context, 'Enter either value of image or text');
          } else {
            _firebaseServices
                .uploadImage(
                    context: context,
                    image: provider.getImageBoxValue == null
                        ? null
                        : provider.getImageBoxValue!)
                .then((value) {
              _firebaseServices.uploadText(
                  context: context,
                  text: provider.getTextBoxValue,
                  imageUrl: value.isEmpty
                      ? provider.getDataModel.imageUrl.isEmpty
                          ? ''
                          : provider.getDataModel.imageUrl
                      : value);
            });
          }
        } else if (provider.getImageBox == false) {
          _firebaseServices.uploadText(
              context: context,
              text: provider.getTextBoxValue,
              imageUrl: provider.getDataModel.imageUrl.isEmpty
                  ? ''
                  : provider.getDataModel.imageUrl);
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
