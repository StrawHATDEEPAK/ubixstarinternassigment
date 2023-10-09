import 'package:flutter/material.dart';

class WidgetBoolProvider extends ChangeNotifier {
  bool _isTextBox = false;
  bool _isImageBox = false;
  bool _isSaveButton = false;

  bool get getTextBox => _isTextBox;
  bool get getImageBox => _isImageBox;
  bool get getSaveButton => _isSaveButton;

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
}
