import 'package:flutter/material.dart';
import './list_kontak.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Settings'),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: daftarKontak.length,
        itemBuilder: (context, index) {
          final contact = daftarKontak[index];
          final firstLetter = contact.name[0];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                firstLetter,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.number),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
      ]),
    );
  }
}
