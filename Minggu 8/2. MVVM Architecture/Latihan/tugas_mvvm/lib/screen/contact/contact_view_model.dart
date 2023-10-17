import 'package:flutter/material.dart';
import 'package:tugas_mvvm/model/api/contact_api.dart';
import 'package:tugas_mvvm/model/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  getAllContacts() async {
    final listContact = await ContactAPI.getContact();
    _contacts = listContact;
    notifyListeners();
  }
}
