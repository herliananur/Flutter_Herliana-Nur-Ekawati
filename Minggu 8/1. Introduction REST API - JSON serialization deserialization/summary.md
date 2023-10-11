# Resume Materi REST API - JSON Serilization/Deserialization

Beberapa poin penting pada materi REST API - JSON Serilization/Deserialization sebagai berikut

1. REST API (Representational State Transfer Application Programming Interface)
   - Arsitektur yang memisahkan tampilan dengan proses bisnis
   - Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request

2. HTTP
   - Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web
   
   Pola Komunikasi
   - Client mengirim request
   - Server mengolah dan membalas dengan memberi response

   |Struktur Request |Struktur Response|
   |----------------|-------------------------------|
   |**URL** Alamat Halaman yang akan di akses|**Status Code** Kode yang mewakili keseluruhan response, baik sukses maupun gagal|
   |**Method (GET, POST, PUT, DELETE)** Menunjukkan aksi yang diinginkan|**Header** Informasi tambahan terkait response yang diberikan|
   |**Header** Informasi tambahan terkait request yang dikirimkan|**Body** Data yang disertakan bersama response|
   |**Body** Data yang disertakan bersama request| |

3. Dio

   Sebuah package yang tersedia di pub dev sebagai HTTP Client yang dimanfaatkan untuk melakukan REST API

   Instalasi
   - Tambahkan dependency pada pubspec.yaml
   - Jalankan perintah flutter pub get pada terminal

   Penggunaan
   Mengambil data menggunakan Dio dan menampilkan hasilnya pada console

4. Serialisasi JSON

   JSON merupakan Javascript Object Notation yang pada umumnya digunakan pada REST API dengan cara penulisan data biasanya menggunakan key dan value.
   - Mengubah struktur data ke bentuk JSON

     Map/List (object) => Serialisasi (object yang kompleks akan diubah menjadi bentuk JSON) => JSON

   Menggunakan fungsi **jsonEncode** dari package **dart:convert**
   ```sh
   import "dart:convert":

   void main() {

     var dataMap = {...};
     var dataJSON = jsonEncode(dataMap);
     print(dataJSON);

   }
   ```

5. Deserialisasi JSON

   Mengubah bentuk JSON ke struktur data

   JSON => Deserialisasi => Map/List

   Menggunakan fungsi **jsonDecode** dari package **dart:convert**
   ```sh
   import "dart:convert";

   void main() {

     var dataJSON = '...';
     var dataMap = jsonDecode(dataJSON);
     print(dataMap);

   }
   ```

6. Penggunaan REST API
   - Penggunaan Method GET (Mengambil data)

     Contoh penggunaan dio dengan method GET
     ```sh
     class MyService (
       final Dio dio = Dio();

       Future fetchUsers() async (
         try {
           final Response response = await dio.get('https://reqres.in/api/users');

           debugPrint(response.data.toString());

           return response.data;
         } catch (e) {
           rethrow;
         }
     }
     ```

   - Penggunaan Method POST (Membuat Data Baru)

     Contoh penggunaan dio dengan method POST
     ```sh
     Future createUser({
       required String name,
       required String job,
     }) async {
       try {
         final Response response = await dio.post(
           'https://reqres.in/api/users',
           data: {
             'name': name,
             'job': job,
           },
         );

         debugPrint(response.data.toString());

         final userModel _userModel = UserModel.fromJson(response.data);

         return response.data;
       } catch (e) {
         rethrow;
       }
     }
     ```

   - Penggunaan Method PUT (Memperbarui Data Yang Ada/Update)

     Contoh penggunaan dio dengan method PUT
     ```sh
     Future updateUser({
       required String name,
       required String job,
     }) async {
       try {
         final Response response = await dio.put(
           'https://reqres.in/api/users/4',
           data: {
             'name': name,
             'job': job,
           },
         );

         debugPrint(response.data.toString());

         return response.data;
       } catch (e) {
         rethrow;
       }
     }
     ```

   - Penggunaan Method DELETE (Menghapus Data)

     Contoh penggunaan dio dengan method DELETE
     ```sh
     Future deleteUser() async {
       try {
         final Response response =
           await dio.delete('https://reqres.in/api/users/4');

         debugPrint(response.data.toString());

         return response.data;
       } catch (e) {
         rethrow;
       }
     }
     ```
