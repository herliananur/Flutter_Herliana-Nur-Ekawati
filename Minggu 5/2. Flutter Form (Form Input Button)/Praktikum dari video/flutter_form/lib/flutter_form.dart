import 'package:flutter/material.dart';

class FlutterForm extends StatefulWidget {
  const FlutterForm({super.key});

  @override
  State<FlutterForm> createState() => _FlutterFormState();
}

class _FlutterFormState extends State<FlutterForm> {
  //property
  var inputController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var radioValue = '';
  var checkValue = false;
  var dropdownValue = 0;

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form'),
      ),

      ///TEXTFIELD
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextField( //build
              controller: inputController,
            ),

            ///RADIO
            ListTile(
              leading: Radio<String>(
                value: 'Laki-laki',
                groupValue: radioValue,
                onChanged: (String? value) {
                  setState(
                    () {
                      radioValue = value ?? '';
                    },
                  );
                },
              ),
              title: const Text('Laki-laki'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'Perempuan',
                groupValue: radioValue,
                onChanged: (String? value) {
                  setState(
                    () {
                      radioValue = value ?? '';
                    },
                  );
                },
              ),
              title: const Text('Perempuan'),
            ),

            ///CHECKBOX
            ListTile(
              leading: Checkbox(
                value: checkValue,
                onChanged: (bool? value) {
                  setState(
                    () {
                      checkValue = value ?? false;
                    },
                  );
                },
              ),
              title: const Text('Setuju/ Tidak Setuju'),
            ),

            ///DROPDOWN BUTTON
            DropdownButton(
              value: dropdownValue,
              onChanged: (int? value) {
                setState(() {
                  dropdownValue = value ?? 0;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text('Pilih ...'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('Satu'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Dua'),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('Tiga'),
                ),
              ],
            ),

            ///BUTTON
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
