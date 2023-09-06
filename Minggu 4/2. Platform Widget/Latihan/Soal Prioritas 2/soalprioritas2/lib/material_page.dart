import 'package:flutter/material.dart';

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
      body: ListView(
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text('Herliana')],
          )
        ],
        // children: const Center(
        //   children: [Text('This is material App')],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
      ]),
    );
  }
}
