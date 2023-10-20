import 'package:flutter/material.dart';
import 'package:soal_ekplorasi_testing/item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error),
            label: 'Information',
          ),
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
      body: SafeArea(
        child: ListView(
          children: itemList
              .map((item) => ListTile(
                    title: Text(item),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
