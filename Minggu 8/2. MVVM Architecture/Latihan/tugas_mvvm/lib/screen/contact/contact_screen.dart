import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_mvvm/screen/contact/contact_view_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Contact API'), centerTitle: true),
      body: ListView.builder(
          itemCount: viewModel.contacts.length,
          itemBuilder: (context, index) {
            final contact = viewModel.contacts[index];

            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.phone),
            );
          }),
    );
  }
}
