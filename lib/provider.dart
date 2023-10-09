import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'model/data_model.dart';

class WidgetBoolProvider extends ChangeNotifier {
  bool _isTextBox = false;
  bool _isImageBox = false;
  bool _isSaveButton = false;

  String _textBoxValue = '';
  XFile? _imageBoxValue;

  DataModel _dataModel = DataModel(text: '', imageUrl: '');
  bool get getTextBox => _isTextBox;
  bool get getImageBox => _isImageBox;
  bool get getSaveButton => _isSaveButton;

  String get getTextBoxValue => _textBoxValue;
  XFile? get getImageBoxValue => _imageBoxValue;

  DataModel get getDataModel => _dataModel;

  void setTextBox(bool value) {
    _isTextBox = value;
    notifyListeners();
  }

  void setImageBox(bool value) {
    _isImageBox = value;
    notifyListeners();
  }

  void setSaveButton(bool value) {
    _isSaveButton = value;
    notifyListeners();
  }

  void setTextBoxValue(String value) {
    _textBoxValue = value;
    notifyListeners();
  }

  void setImageBoxValue(XFile? value) {
    _imageBoxValue = value;
    notifyListeners();
  }

  void setData(String jsonData) {
    _dataModel = DataModel.fromJson(jsonData);
    notifyListeners();
  }
}
