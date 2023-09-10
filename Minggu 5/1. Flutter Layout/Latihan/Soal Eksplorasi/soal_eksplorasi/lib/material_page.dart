import 'package:flutter/material.dart';
import './item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Color primaryColor() {
    return const Color(0XFF6200EE);
  }

  Color secondaryColor() {
    return const Color(0XFF03DAC5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        backgroundColor: primaryColor(),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.error), label: 'Information')
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: primaryColor(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor(),
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Text(itemList[0]),
            ),
            const Divider(
              indent: 16,
            ),
            ListTile(
              title: Text(itemList[1]),
            ),
            ListTile(
              title: Text(itemList[2]),
            ),
            const Divider(
              indent: 16,
            ),
            ListTile(
              title: Text(itemList[3]),
            ),
            const Divider(
              indent: 16,
            ),
            // Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 10, left: 16),
              title: Text(itemList[4]),
            ),
            const Divider(
              indent: 16,
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 10, left: 16),
              title: Text(itemList[5]),
            ),
            const Divider(
              indent: 16,
            ),
            ListTile(
              title: Text(itemList[6]),
            ),
            const Divider(
              indent: 16,
            ),
          ],
        ),
      ),

      // body: ListView.separated(
      //   itemCount: itemList.length, // Jumlah item dalam daftar
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(itemList[index]),
      //     );
      //   },
      //   separatorBuilder: (BuildContext context, int index) {
      //     return Divider(); // Tambahkan Divider antara item
      //   },
      // ),
    );
  }
}
