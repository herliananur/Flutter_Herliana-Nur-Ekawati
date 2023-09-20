import 'package:flutter/material.dart';
import 'package:task_form/model/contact_model.dart';
import 'package:task_form/page/contact_page/widget/header_contact_page.dart';
import 'package:task_form/theme/theme_color.dart';
import 'package:task_form/theme/theme_text_style.dart';
import 'package:task_form/widget/button_widget.dart';
import 'package:task_form/widget/text_field_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Value
  String _nameValue = "";
  String _numberValue = "";

  // Message Error
  String? messageErrorNameValue;
  String? messageErrorNumberValue;

  List<ContactModel> contactModel = [];

  bool _isFormValid = false;

  //fungsi untuk memberi pesan error pada textfield nama
  void nameOnChanged(String value) {
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
    _isFormValid =
        messageErrorNameValue == null && messageErrorNumberValue == null;
    setState(() {});
  }

  //fungsi untuk memberi pesan error pada textfield number
  void numberOnChanged(String value) {
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
    _isFormValid =
        messageErrorNameValue == null && messageErrorNumberValue == null;

    setState(() {});
  }

  //fungsi tambah kontak
  void addContact() {
    contactModel.add(
      ContactModel(
          name: _nameValue,
          number: _numberValue,
          title: 'Contacts${contactModel.length + 1}',
          subtitle: 'Contacts'),
    );
    resetField();
    setState(() {});
  }

  //fungsi hapus kontak
  void removeContact(int index) {
    contactModel.removeAt(index);
    setState(() {});
  }

  int selectIndexContact = -1;

  //fungsi edit kontak
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
      setState(() {});
    }
  }

  // fungsi untuk print data ke console
  void prinContactData() {
    List<Map<String, String>> contactData = [];
    for (int i = 0; i < contactModel.length; i++) {
      contactData.add({
        'title': contactModel[i].title,
        'subtitle': contactModel[i].subtitle,
      });
    }
    print(contactData);
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  void resetField() {
    _nameController.clear();
    _numberController.clear();
    _nameValue = '';
    _numberValue = '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Contact',
          style: ThemeTextStyle().m3HeadlineSmall,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: 'Name',
            hintText: 'Insert Your Name',
            controller: _nameController,
            errorText: messageErrorNameValue,
            onChanged: (val) {
              _nameValue = val;
              nameOnChanged(_nameValue);
              setState(() {});
              // print(_nameValue);
            },
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62...',
            controller: _numberController,
            errorText: messageErrorNumberValue,
            textInputType: TextInputType.phone,
            onChanged: (val) {
              _numberValue = val;
              numberOnChanged(_numberValue);
              setState(() {});
              // print(_numberValue);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: _isFormValid
                      ? () {
                          if (selectIndexContact == -1) {
                            addContact();
                          } else {
                            updateContact(selectIndexContact);
                          }
                          prinContactData();
                          _isFormValid = false;
                          setState(() {});
                          // print(_nameValue);
                        }
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 49,
          ),
          Text(
            'List Contacts',
            style: ThemeTextStyle().m3HeadlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: double.infinity,
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ThemeColor().m3SysLightSurface,
              borderRadius: BorderRadius.circular(28),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contactModel.length,
              itemBuilder: (context, index) {
                var data = contactModel[index];
                return ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            ThemeColor().m3SysLightPrimaryContainer,
                        child: Text(
                          data.name[0],
                          style: TextStyle(
                              color: ThemeColor().m3SysLightonPrimaryContainer),
                        ),
                      ),
                      title: Text(data.name),
                      subtitle: Text(data.number),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _nameController.text = data.name;
                              _numberController.text = data.number;
                              selectIndexContact = index;
                              setState(() {});
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              removeContact(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
