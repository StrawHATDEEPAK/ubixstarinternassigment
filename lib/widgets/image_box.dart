import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_intern_assignment/provider.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({super.key});

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  String imageUrl = '';
  var _image;
  XFile? image;
  XFile? pickedFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetBoolProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          image = await picker.pickImage(source: ImageSource.gallery);
          provider.setImageBoxValue(image);
          if (image != null) {
            setState(() {
              _image = File(image!.path);
            });
          }
        },
        child: Container(
            // padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey.shade500,
                  style: BorderStyle.solid,
                  width: 3),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Provider.of<WidgetBoolProvider>(context, listen: true)
                    .getDataModel
                    .imageUrl
                    .isNotEmpty
                ? Image.network(
                    Provider.of<WidgetBoolProvider>(context, listen: true)
                        .getDataModel
                        .imageUrl,
                    fit: BoxFit.cover,
                  )
                : image != null
                    ? Image.file(
                        _image,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.file_copy_rounded)),
      ),
    );
  }
}
