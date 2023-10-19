import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:advance_form/home_page.dart';

void main() {
  testWidgets('Test HomePage', (WidgetTester tester) async {
    // Build widget
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    // Cek Text di AppBar
    expect(find.text('Interactive Widget'), findsOneWidget);

    // Cek Date dan Color widget
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Color'), findsOneWidget);

    // Cek TextButton Select
    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();

    // Cek color picker dialog
    // expect(find.text('Pick Your Color'), findsOneWidget);

    //  Cek Text Save
    // await tester.tap(find.text('Save'));
    // await tester.pumpAndSettle();

    // Cek Text Pick Color
    await tester.tap(find.text('Pick Color'));
    await tester.pumpAndSettle();

    //  Cek Text Pick Files
    expect(find.text('Pick Files'), findsOneWidget);

    // Cek ElevatedButton Text
    await tester.tap(find.text('Pick and Open File'));
    await tester.pump();
  });
}
