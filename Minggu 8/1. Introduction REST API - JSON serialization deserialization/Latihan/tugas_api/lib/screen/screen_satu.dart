import 'package:flutter/material.dart';
import 'package:tugas_api/api/post_satu_api.dart';

class ScreenSatu extends StatefulWidget {
  const ScreenSatu({super.key});

  @override
  State<ScreenSatu> createState() => _ScreenSatuState();
}

class _ScreenSatuState extends State<ScreenSatu> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String message = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal Nomor 1 (Post)'),
      ),
      drawer: buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                int id = int.tryParse(idController.text) ?? 0;
                String name = nameController.text;
                String phone = phoneController.text;

                //validasi
                if (id == 0 || name.isEmpty || phone.isEmpty) {
                  setState(() {
                    errorMessage = 'Semua kolom wajib diisi!';
                    message = '';
                  });
                  return;
                }

                await postSatuAPI(id: id, name: name, phone: phone);
                setState(() {
                  message =
                      'Data yang di Post\nID: $id, Name: $name, Phone: $phone';
                  errorMessage = '';
                });
              },
              child: const Text('Post'),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              errorMessage,
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Soal Nomor 1'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Soal Nomor 2'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/nomor2');
            },
          ),
          ListTile(
            title: const Text('Soal Nomor 3'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/nomor3');
            },
          ),
        ],
      ),
    );
  }
}
