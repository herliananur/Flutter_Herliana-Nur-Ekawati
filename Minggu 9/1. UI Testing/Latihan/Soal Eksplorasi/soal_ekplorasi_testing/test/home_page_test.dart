import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal_ekplorasi_testing/home_page.dart';
import 'package:soal_ekplorasi_testing/item_list.dart';

void main() {
  testWidgets('Test Home Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    // Cek Text AppBar
    expect(find.text('My Flutter App'), findsOneWidget);

    // Cek Item List
    for (final item in itemList) {
      expect(find.text(item), findsOneWidget);
    }

    // Cek Bottom Navigation Bar
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Cek Floating Action Button
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
