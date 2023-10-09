import 'dart:convert';

class DataModel {
  final String text;
  final String imageUrl;
  DataModel({
    required this.text,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'imageUrl': imageUrl,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      text: map['text'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source));
}
