import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_provider/provider/button_provider.dart';
import 'package:tugas_provider/provider/number_provider.dart';
import 'package:tugas_provider/provider/username_provider.dart';
import 'package:tugas_provider/screens/contact_screen/widget/header_contact.dart';
import 'package:tugas_provider/theme/theme_color.dart';
import 'package:tugas_provider/theme/theme_text_style.dart';
import 'package:tugas_provider/widget/button_widget.dart';
import 'package:tugas_provider/widget/text_field_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final usernameProvider = Provider.of<UsernameProvider>(context);
    final numberProvider = Provider.of<NumberProvider>(context);
    final buttonProvider = Provider.of<ButtonProvider>(context);
    //
    void _clearFields() {
      usernameProvider.nameController.clear();
      numberProvider.numberController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Contact',
          style: ThemeTextStyle().m3HeadlineSmall,
        ),
        centerTitle: true,
      ),
      //
      drawer: buildDrawer(context),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: 'Name',
            hintText: 'Insert Your Name',
            controller: usernameProvider.nameController,
            errorText: usernameProvider.messageErrorNameValue,
            onChanged: (val) {
              usernameProvider.nameOnChanged(val);
            },
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62...',
            controller: numberProvider.numberController,
            errorText: numberProvider.messageErrorNumberValue,
            textInputType: TextInputType.phone,
            onChanged: (val) {
              numberProvider.numberOnChanged(val);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                    title: 'Submit',
                    onPressed: () {
                      if (usernameProvider.messageErrorNameValue == null &&
                          numberProvider.messageErrorNumberValue == null &&
                          usernameProvider.nameController.text.isNotEmpty &&
                          numberProvider.numberController.text.isNotEmpty) {
                        if (buttonProvider.selectIndexContact == -1) {
                          buttonProvider.addContact(
                            name: usernameProvider.nameValue,
                            number: numberProvider.numberValue,
                          );
                        } else {
                          buttonProvider.updateContact(
                            buttonProvider.selectIndexContact,
                            name: usernameProvider.nameValue,
                            number: numberProvider.numberValue,
                          );
                          buttonProvider.selectIndexContact = -1;
                        }
                        _clearFields();
                      }
                    })
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
              itemCount: buttonProvider.contactModel.length,
              itemBuilder: (context, index) {
                var data = buttonProvider.contactModel[index];
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
                          buttonProvider.selectIndexContact = index;
                          usernameProvider.nameController.text = data.name;
                          numberProvider.numberController.text = data.number;
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          buttonProvider.removeContact(index);
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
