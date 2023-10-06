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

3. Deskripsi
   Class yang perlu diperhatikan dalam penggunaan provider, yaitu:
   - Dari Package Provider
        - ChangeNotifierProvider
        - MultiProvider
        - Consumer
   - Built In class dari Flutter SDK
        - ChangeNotifier

4. ChangeNotifier
   - Class yang menambahkan dan menghapus listeners
   - Digunakan dengan cara meng-extends
   - Memanggil notifyListeners(), fungsi yang memberitahu widget yang menggunakan state bahwa terjadi perubahan data sehingga UI nya harus dibangun ulang
     ```sh
     import 'package:flutter/foundation.dart';

     class CartManager extends ChangeNotifier{}
     ```
5. ChangeNotifierProvider
   - Widget yang membungkus sebuah class
   - Mengimplementasikan ChangeNotifier dan menggunakan child untuk widget UI nya
   - Menggunakan create, provider yang akan menyimpan model yang telah dibuat
     ```sh
     ChangeNotifierProvider(
        create: (context) => MyModel(),
        child: <widget>,
     );
     ```
6. MultiProvider
   - Jika kita membutuhkan lebih dari satu provider
     ```sh
     MultiProvider(
        providers:[
           Provider<MyModel>(create:(_) => Something()),
           Provider<MyDatabase>(create: (_) => SomethingMore()),
        ],
        child: <widget>
     );
     ```
7. Consumer
   - Widget yang mendengarkan perubahan kelas yang mengimplementasikan ChangeNotifier
   - Membangun ulang widget yang dibungkus Consumer saja
   - Penting untuk meletakan Consumer pada lingkup sekecil mungkin
   - Membutuhkan properti buulder yang berisi context, model, dan child
     ```sh
     Consumer<MyModel>(
        builder: (context, model, child) {
           return Text('Hello ${model.value}');
        }
     );
     ```
   - Anda akan mendapatkan keuntungan otomatisasi pembaruan widget ketika data berubah. Dengan kata lain, Consumer secara otomatis akan membangun ulang bagian dari widget tree yang bergantung pada data yang berubah, sehingga anda tidak perlu memanggil setState secara manual
   - Namun, jika anda ingin memaksimalkan kemudahan pengembangan, otomatisasi, dan menghindari kesalahan dalam manejemen pembaruan widget, maka menggunakan Consumer adalah pilihan yang lebih efektif. Dengan Consumer, anda hanya perlu mendefinisikan bagian dari widget tree yang harus diperbarui saat data berubah, sehingga mengurangi risiko kesalahan manusia dalam pembaruan widget.
  
8. Provider.of
   - Penggunaan Provider.of dapat menjadi lebih efektif dalam beberapa situasi di mana anda ingin mengontrol pembaruan widget secara manual atau jika struktur widget tree anda sederhana. Misalnya, anda ingin mengakses data sekali pada tahap awal pembangunan widget tree atau jika anda memiliki widget yang tidak perlu diperbarui saat data berubah.
