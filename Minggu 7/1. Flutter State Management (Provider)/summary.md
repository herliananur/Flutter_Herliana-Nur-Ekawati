# Resume Materi Flutter State Managemet (Provider)

Beberapa poin penting dalam materi Flutter State Management (Provider) sebagai berikut

1. Pengertian State
   - Data yang dapat dibaa saat pembuatan widget
   - Dapat berubah saat widget sedang aktif
   - Hanya dimiliki oleh StatefulWidget
   
   Memanfaatkan State
   - Dibuat sebagai property dari class
   - Digunakan pada widget saat build
   ```sh
   // property
   var number = 0;

   // build
   Text('$number')
   ```

   Mengubah State
   - Menggunakan method setState
   ```sh
   ElevatedButton(
     child: const Text('Tambah'),
     onPressed:(){
       setState(() {
         number = number + 1;
       });
     },
   );
   ```

2. Global State
   Pengertian
   - State biasa yang dapat digunakan pada seluruh widget
   
   Kenapa Perlu Global State?
   - Agar antara widget dapat memanfaatkan state yang sama dengan mudah
   
   Provider
   - State Management
   - Perlu di-install agar dapat digunakan
   
   Instalasi Provider
   - Menambah package provider pada bagian dependencies dalam file pubspec.yaml
   - Jalankan perintah flutter pub get
   ```sh
   depedencies:
     provider:
   ```

   Membuat State Provider
   - Buat file bernama contact.dart
   - Definisikan state dalam bentuk class
   ```sh
   import 'package:flutter/material.dart';

   class Contact with ChangeNotifier {
     List<Map<String, String>> _contacs = [];

     List<Map<String, String>> get contacts => _contacts;

     void add(Map<String, String> contact) {
       _contacts.add(contact);
       notifyListeners();
     }
   }
   ```

   Mendaftarkan State Provider
   - Import dalam file main.dart
   - Daftarkan pada runApp dengan MultiProvider
   ```sh
   import 'package:flutter/material.dart';
   import 'package:provider/provider.dart';
   import 'package:phonebookapp/stores/contact.dart' as contact_store;

   void main() {
     runApp(
       MultiProvider(
         providers: [
           ChangeNotifierProvider(create: (_) => contact_store,
         ),
         child: MyWidget(),
       ],
     );
   }
   ```

   Menggunakan State dari Provider
   - Simpan provider dalam variable
   - Ambil data dari provider melalui getter
   ```sh
   // build
   final contactProvider = Provider.of<contact_store.Contact>(context);

   // return
   ListView.builder(
     itemCount: contactProvider.contacts.length,
     itemBuilder: (context, index) {
       return ListTile(
         title: Text(contactProvider.contacts[index]['name'] ?? ''),
         subtitle: Text(contactProvider.contacts[index]['phone'] ?? ''),
       );
     }
   );
