import 'package:flutter/material.dart';
import 'package:tugas_bloc/models/contact_manager.dart';
import 'package:tugas_bloc/screen/contact_screen/widget/header_contact.dart';
import 'package:tugas_bloc/theme/theme_color.dart';
import 'package:tugas_bloc/theme/theme_text_style.dart';
import 'package:tugas_bloc/widget/button_widget.dart';
import 'package:tugas_bloc/widget/text_field_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // final ContactManager contactManager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Contact',
          style: ThemeTextStyle().m3HeadlineSmall,
        ),
        centerTitle: true,
      ),
      drawer: buildDrawer(context),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: 'Name',
            hintText: 'Insert Your Name',
            controller: contactManager.nameController,
            errorText: contactManager.messageErrorNameValue,
            onChanged: (val) {
              contactManager.nameOnChanged(val);
              setState(() {});
            },
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62...',
            controller: contactManager.numberController,
            errorText: contactManager.messageErrorNumberValue,
            textInputType: TextInputType.phone,
            onChanged: (val) {
              contactManager.numberOnChanged(val);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: (contactManager.messageErrorNameValue == null &&
                          contactManager.messageErrorNumberValue == null &&
                          contactManager.nameController.text.isNotEmpty &&
                          contactManager.numberController.text.isNotEmpty)
                      ? () {
                          if (contactManager.selectedContact == null) {
                            contactManager.addContact();
                          } else {
                            contactManager.updateContact(
                                contactManager.selectIndexContact);
                          }
                          setState(() {});
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
              itemCount: contactManager.contactModel.length,
              itemBuilder: (context, index) {
                var data = contactManager.contactModel[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ThemeColor().m3SysLightPrimaryContainer,
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
                          contactManager.nameController.text = data.name;
                          contactManager.numberController.text = data.number;
                          contactManager.selectedContact = data;
                          setState(() {});
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          contactManager.removeContact(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
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
