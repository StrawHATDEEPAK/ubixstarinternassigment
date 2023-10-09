import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_intern_assignment/provider.dart';
import 'package:ubixstar_intern_assignment/util.dart';

import '../model/data_model.dart';

class FirebaseServices {
  void uploadText(
      {required BuildContext context,
      required String text,
      required String imageUrl}) {
    final firestore = FirebaseFirestore.instance;
    try {
      firestore
          .collection('text')
          .doc('text&image')
          .set({'text': text, 'imageUrl': imageUrl}).then((value) {
        showSnackBar(context, 'Text uploaded');
      }).onError((error, stackTrace) {
        showSnackBar(context, 'Error Uploading Text');
        debugPrint(
            'Error: ${error.toString()} \n stacktrace: ${stackTrace.toString()}');
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> uploadImage(
      {required BuildContext context, required XFile? image}) async {
    final _firebaseStorage = FirebaseStorage.instance;
    String url = '';

    try {
      if (image != null) {
        var file = File(image.path);
        var snapshot = await _firebaseStorage
            .ref()
            .child('images/imageName')
            .putFile(file)
            .whenComplete(() => showSnackBar(context, 'Image Uploaded'));
        url = await snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return url;
  }

  void getData({required BuildContext context}) async {
    dev.log('getData', name: 'FirebaseServices');
    final firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('text').doc('text&image').get().then((value) {
        dev.log(value.data().toString(), name: 'data');
        if (value.data() != null) {
          Provider.of<WidgetBoolProvider>(context, listen: false)
              .setData(jsonEncode(value.data()));
        }
      });
    } catch (e) {
      dev.log(e.toString());
    }
  }
}
