import 'package:flutter/material.dart';
import 'package:mvvm_architecture/screen/contact/contact_screen.dart';
import 'package:mvvm_architecture/screen/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactScreen(),
      ),
    ),
  );
}
