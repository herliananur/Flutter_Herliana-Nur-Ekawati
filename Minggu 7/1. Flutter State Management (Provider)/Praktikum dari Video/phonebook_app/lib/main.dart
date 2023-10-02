import 'package:flutter/material.dart';
import 'package:phonebook_app/home_page.dart';
import 'package:provider/provider.dart';
import 'package:phonebook_app/stores/contact.dart' as contact_store;

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => contact_store.Contact())
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Phone Book App',
      home: HomePage(),
    );
  }
}
