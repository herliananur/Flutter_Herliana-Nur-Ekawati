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
    // resetField();
    notifyListeners();
  }

  void removeContact(int index) {
    _contactModel.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index,
      {required String name, required String number}) {
    _contactModel[index].name = name;
    _contactModel[index].number = number;
    notifyListeners();
  }

  // void updateNameContact(int index, String name) {
  //   _contactModel.removeAt(index).name = name;
  //   notifyListeners();
  // }

  // void updateNumberContact(int index, String number) {
  //   _contactModel.removeAt(index).number = number;
  //   notifyListeners();
  // }
}
