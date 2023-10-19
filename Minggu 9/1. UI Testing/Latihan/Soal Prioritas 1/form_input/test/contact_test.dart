import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_input/page/contact_page/contact_page.dart';

void main() {
  testWidgets('Test ContactPage', (WidgetTester tester) async {
    // Build widget
    await tester.pumpWidget(const MaterialApp(home: ContactPage()));

    // Cek Text 'Contact'
    expect(find.text('Contact'), findsOneWidget);

    // Cek TextField
    await tester.enterText(find.byKey(const Key('nameTextField')), 'Herliana');
    await tester.enterText(
        find.byKey(const Key('numberTextField')), '088111212121');

    // Tombol "Submit" dapat ditekan
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump();

    // Cek pesan kesalahan tidak muncul
    expect(find.text('Nama tidak boleh kosong'), findsNothing);
    expect(find.text('Nomor telepon tidak boleh kosong'), findsNothing);

    // Terdapat text 'List Contacts'
    expect(find.text('List Contacts'), findsOneWidget);
  });
}
