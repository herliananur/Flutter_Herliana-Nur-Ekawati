import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_bloc/bloc/contact_bloc.dart';
import 'package:tugas_bloc/bloc/contact_event.dart';
import 'package:tugas_bloc/models/contact_model.dart';
import 'package:tugas_bloc/screen/contact_screen/widget/header_contact.dart';
import 'package:tugas_bloc/theme/theme_color.dart';
import 'package:tugas_bloc/theme/theme_text_style.dart';
import 'package:tugas_bloc/widget/button_widget.dart';
import 'package:tugas_bloc/widget/text_field_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  int selectedContactIndex = -1;

  final _formKey = GlobalKey<FormState>();

  void _addContact(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      String name = nameController.text;
      String number = numberController.text;
      ContactModel newContact = ContactModel(
        name: name,
        number: number,
      );

      context.read<ContactBloc>().add(AddContactEvent(newContact));
      nameController.clear();
      numberController.clear();
    }
  }

void _updateContact(BuildContext context, List<ContactModel> contacts) {
  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
    String editedName = nameController.text;
    String editedNumber = numberController.text;

    if (editedName.isNotEmpty && editedNumber.isNotEmpty) {
      final editedContact = ContactModel(name: editedName, number: editedNumber);
      final updatedContacts = List<ContactModel>.from(contacts);
      updatedContacts[selectedContactIndex] = editedContact;

      context.read<ContactBloc>().add(
        UpdateContactEvent(updatedContacts),
      );
      nameController.clear();
      numberController.clear();
      selectedContactIndex = -1;
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Contact',
          style: ThemeTextStyle().m3HeadlineSmall,
        ),
      ),
      drawer: buildDrawer(context),
      body: ListView(
        children: [
          const HeaderContactPage(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFieldWidget(
                  label: 'Name',
                  hintText: 'Insert Your Name',
                  controller: nameController,
                  onChanged: (val) {},
                ),
                TextFieldWidget(
                  label: 'Nomor',
                  hintText: '+62...',
                  controller: numberController,
                  onChanged: (val) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonWidget(
                        title: selectedContactIndex == -1 ? 'Submit' : 'Update',
                        onPressed: selectedContactIndex == -1
                            ? () => _addContact(context)
                            : () => _updateContact(context, context.read<ContactBloc>().state),
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
                  child: BlocBuilder<ContactBloc, List<ContactModel>>(
                    builder: (context, contacts) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: contacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  ThemeColor().m3SysLightPrimaryContainer,
                              child: Text(
                                contacts[index].name.isNotEmpty
                                    ? contacts[index].name[0].toUpperCase()
                                    : '?',
                                style: TextStyle(
                                    color: ThemeColor()
                                        .m3SysLightonPrimaryContainer),
                              ),
                            ),
                            title: Text(contacts[index].name),
                            subtitle: Text(contacts[index].number),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    nameController.text = contacts[index].name;
                                    numberController.text = contacts[index].number;
                                    selectedContactIndex = index;
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<ContactBloc>().add(
                                          DeleteContactEvent(index),
                                        );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/gallery');
            },
          ),
        ],
      ),
    );
  }
}
