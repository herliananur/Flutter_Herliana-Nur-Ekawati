# Resume Materi MVVM Architecture

Beberapa point penting pada materi MVVM Architecture sebagai berikut

1. Apa itu MVVM Architecture?

   MVVM (Model-View ViewModel) merupakan pemisahan logic dengan tampilan UI (view) ke dalam ViewModel

2. Keuntungan MVVM Architecture
   - Reusability

     Jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama
   - Maintainability

     Mudah dirawat karena pekerjaan terkait tampilan tidak bertumpuk bersama logic
   - Testability

     Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian

3. Melakukan MVVM

   **Struktur Direktori**
   - Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut
   - Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel
     
   **Model**
   - Bentuk data yang akan digunakan, dibuat dalam bentuk class
   - Data-data yang dimuat, diletakkan pada property
   ```sh
   class Contact {
      final int id;
      final String name;
      final String phone;

    Contact({
      required this.id,
      required this.name,
      required this.phone,
      });
    }
   ```

   **Model API**
   ```sh
   class ContactAPI {
      static Future<List<Contact>> getContact() async {
        final response = await Dio()
           .get("https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts");

        List<Contact> contacts = (response.data as List)
          .map( (e) => Contact(id: e['id'], name: e['name'], phone: e['phone']))
          .toList();
        return contacts;
      }
    }
   ```
   
   **ViewModel**
   - Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
   - Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga
   ```sh
   class ContactViewModel with ChangeNotifier {
      List<Contact> _contacts = [];
      List<Contact> get contacts => _contacts;

      getAllContacts() async {
         final c = await ContactAPI.getContact();
         _contacts = c;
         notifyListeners();
      }
    }
   ```

   **Mendaftarkan ViewModel**
   - Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel
   - MaterialApp sebagai child utama
   ```sh
   void main() {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ContactViewModel(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ContactScreen(),
          ),
        ),
      );
    }
   ```

   **View**
   - Menggunakan StatefulWidget
   ```sh
    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
      });
    }
   ```

   **Menampilkan Data di View**
   - Letakkan pada bagian build
   - Menggunakan getters yang ada pada ViewModel
   - Data dapat langsung ditampilkan pada widgets
   ```sh
   final modelView = Provider.of<ContactViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Contacts'),
        ),
        body: ListView.builder(
            itemCount: modelView.contacts.length,
            itemBuilder: (context, index) {
              final contact = modelView.contacts[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
              );
            }));
   ```

   
