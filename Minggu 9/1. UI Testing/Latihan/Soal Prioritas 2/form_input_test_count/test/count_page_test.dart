import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_input_test_count/page/count_page.dart';

void main() {
  testWidgets('CountPage widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: CountPage(),
    ));

    // Cek Text nilai awal adalah 0
    expect(find.text('0'), findsOneWidget);

    // Cek tombol icon add
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Cek ketika tombol add di tekan
    expect(find.text('1'), findsOneWidget);

    // Cek tombol icon remove
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Cek ketika tombol remove di tekan
    expect(find.text('0'), findsOneWidget);
  });
}
