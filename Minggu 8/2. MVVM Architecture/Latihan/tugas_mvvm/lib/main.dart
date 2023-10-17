import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_mvvm/screen/contact/contact_screen.dart';
import 'package:tugas_mvvm/screen/contact/contact_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ContactViewModel(),
      )
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactScreen(),
    ),
  ));
}
