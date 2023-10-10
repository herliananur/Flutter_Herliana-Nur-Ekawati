import 'package:flutter/material.dart';
import 'package:tugas_bloc/widget/bottom_sheet_widget.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1480&q=80',
    'https://images.unsplash.com/photo-1574158622682-e40e69881006?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1480&q=80',
    'https://images.unsplash.com/photo-1596854372407-baba7fef6e51?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1480&q=80',
    'https://images.unsplash.com/photo-1596854273338-cbf078ec7071?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1480&q=80',
    'https://images.unsplash.com/photo-1596854307809-6e754c522f95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1480&q=80'
  ];
  GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Galeri'),
      ),
      drawer: buildDrawer(context),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BottomSheetWidget(
                    imageUrl: imageUrls[index],
                    imageIndex: index,
                  );
                },
              );
            },
            child: Image.network(imageUrls[index]),
          );
        },
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Galeri'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/gallery');
            },
          ),
        ],
      ),
    );
  }
}
