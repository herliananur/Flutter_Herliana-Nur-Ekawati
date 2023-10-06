import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  String _numberValue = "";
  String get numberValue => _numberValue;

  String? _messageErrorNumberValue;
  String? get messageErrorNumberValue => _messageErrorNumberValue;

  final TextEditingController _numberController = TextEditingController();
  TextEditingController get numberController => _numberController;

  bool isFormValid = false;

  void numberOnChanged(String value) {
    _numberValue = value;
    if (_numberValue.isEmpty) {
      _messageErrorNumberValue = 'Nomor telepon tidak boleh kosong';
    } else if (!_numberValue.contains(RegExp(r'^[0-9]+$'))) {
      _messageErrorNumberValue = 'Nomor telepon harus terdiri dari angka saja';
    } else if (_numberValue.length < 8 || _numberValue.length > 15) {
      _messageErrorNumberValue =
          'Panjang nomor telepon minimal 8 digit dan maksimal 15 digit';
    } else if (!_numberValue.startsWith('0')) {
      _messageErrorNumberValue = 'Nomor telepon harus dimulai dengan angka 0';
    } else {
      _messageErrorNumberValue = null;
    }
    isFormValid = _messageErrorNumberValue == null;

    notifyListeners();
  }
}
