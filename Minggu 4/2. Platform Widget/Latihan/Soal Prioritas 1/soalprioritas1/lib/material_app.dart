import 'package:flutter/material.dart';
import 'material_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final darkTheme = ThemeData.dark().copyWith();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      // darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}

class ListContact {
  final String name;
  final String number;

  ListContact({
    required this.name,
    required this.number,
  });
}

List<ListContact> daftarkontak = [
  ListContact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
  ListContact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
  ListContact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
  ListContact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
  ListContact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
  ListContact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
  ListContact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
];
