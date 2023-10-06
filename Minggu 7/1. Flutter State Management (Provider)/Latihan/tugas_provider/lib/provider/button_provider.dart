import 'package:flutter/material.dart';
import 'package:tugas_provider/models/contact_model.dart';

class ButtonProvider with ChangeNotifier {
  final List<ContactModel> _contactModel = [];
  List<ContactModel> get contactModel => _contactModel;
  int selectIndexContact = -1;
  void addContact({
    required String name,
    required String number,
  }) {
    _contactModel.add(
      ContactModel(
          name: name,
          number: number,
          title: 'Contacts${contactModel.length + 1}',
          subtitle: 'Contacts'),
    );
    notifyListeners();
  }

  void removeContact(int index) {
    _contactModel.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index,
      {required String name, required String number}) {
    if (index >= 0 && index < _contactModel.length) {
      _contactModel[index].name = name;
      _contactModel[index].number = number;
      notifyListeners();
    }
  }
}
