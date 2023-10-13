import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildListTile(context, 'Contact Us', '/'),
          buildListTile(context, 'About Us', '/about-us'),
          buildListTile(context, 'Login', '/login'),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String title, String route) {
    return ListTile(
      title: ElevatedButton(
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, route);
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
