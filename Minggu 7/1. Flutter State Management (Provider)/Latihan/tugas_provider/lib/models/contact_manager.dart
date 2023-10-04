import 'package:flutter/material.dart';
import 'package:tugas_provider/models/contact_model.dart';

class ContactManager extends ChangeNotifier {
  String _nameValue = "";
  String _numberValue = "";

  // Message Error
  String? messageErrorNameValue;
  String? messageErrorNumberValue;

  List<ContactModel> contactModel = [];

  bool isFormValid = false;

  int selectIndexContact = -1;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  void nameOnChanged(String value) {
    _nameValue = value;
    if (_nameValue.isEmpty) {
      messageErrorNameValue = 'Nama tidak boleh kosong';
    } else if (_nameValue.split(' ').length < 2) {
      messageErrorNameValue = 'Nama harus terdiri dari minimal 2 kata';
    } else if (!_nameValue
        .split(' ')
        .every((word) => word[0].toUpperCase() == word[0])) {
      messageErrorNameValue = 'Setiap kata harus dimulai dengan huruf kapital';
    } else if (_nameValue
        .contains(RegExp(r'[0-9!@#\$%^&*()_+{}\[\]:;<>,.?~\\\/\-]'))) {
      messageErrorNameValue =
          'Nama tidak boleh mengandung angka atau karakter khusus';
    } else {
      messageErrorNameValue = null;
    }
    isFormValid =
        messageErrorNameValue == null && messageErrorNumberValue == null;
    notifyListeners();
  }

  void numberOnChanged(String value) {
    _numberValue = value;
    if (_numberValue.isEmpty) {
      messageErrorNumberValue = 'Nomor telepon tidak boleh kosong';
    } else if (!_numberValue.contains(RegExp(r'^[0-9]+$'))) {
      messageErrorNumberValue = 'Nomor telepon harus terdiri dari angka saja';
    } else if (_numberValue.length < 8 || _numberValue.length > 15) {
      messageErrorNumberValue =
          'Panjang nomor telepon minimal 8 digit dan maksimal 15 digit';
    } else if (!_numberValue.startsWith('0')) {
      messageErrorNumberValue = 'Nomor telepon harus dimulai dengan angka 0';
    } else {
      messageErrorNumberValue = null;
    }
    isFormValid =
        messageErrorNameValue == null && messageErrorNumberValue == null;

    notifyListeners();
  }

  void addContact() {
    contactModel.add(
      ContactModel(
          name: _nameValue,
          number: _numberValue,
          title: 'Contacts${contactModel.length + 1}',
          subtitle: 'Contacts'),
    );
    resetField();
    notifyListeners();
  }

  void removeContact(int index) {
    contactModel.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index) {
    if (_nameValue.isNotEmpty && _numberValue.isNotEmpty) {
      contactModel[index] = ContactModel(
        name: _nameValue,
        number: _numberValue,
        title: 'Contacts${index + 1}',
        subtitle: 'Contacts',
      );
      resetField();
      index = -1;
      notifyListeners();
    }
  }

  void resetField() {
    nameController.clear();
    numberController.clear();
    _nameValue = '';
    _numberValue = '';
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
