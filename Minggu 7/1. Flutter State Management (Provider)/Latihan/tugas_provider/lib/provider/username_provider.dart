import 'package:flutter/material.dart';

class UsernameProvider with ChangeNotifier {
  String _nameValue = '';
  String get nameValue => _nameValue;

  String? _messageErrorNameValue;
  String? get messageErrorNameValue => _messageErrorNameValue;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  bool isFormValid = false;
  
  void nameOnChanged(String value) {
    _nameValue = value;
    if (_nameValue.isEmpty) {
      _messageErrorNameValue = 'Nama tidak boleh kosong';
    } else if (_nameValue.split(' ').length < 2) {
      _messageErrorNameValue = 'Nama harus terdiri dari minimal 2 kata';
    } else if (!_nameValue
        .split(' ')
        .every((word) => word[0].toUpperCase() == word[0])) {
      _messageErrorNameValue = 'Setiap kata harus dimulai dengan huruf kapital';
    } else if (_nameValue
        .contains(RegExp(r'[0-9!@#\$%^&*()_+{}\[\]:;<>,.?~\\\/\-]'))) {
      _messageErrorNameValue =
          'Nama tidak boleh mengandung angka atau karakter khusus';
    } else {
      _messageErrorNameValue = null;
    }
    isFormValid = messageErrorNameValue == null;
    notifyListeners();
  }
}
