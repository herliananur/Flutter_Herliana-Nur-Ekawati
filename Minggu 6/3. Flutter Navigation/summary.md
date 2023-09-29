# Resume Materi Flutter Navigation

Beberapa poin penting pada materi Flutter Navigation sebagai berikut:

1. **Navigation**

   Dimana pengguna dapat berpindah halaman dari halaman satu ke halaman lain.

2. Navigation Dasar
   - Perpindahan halaman menggunakan Navigator.push()
   - Kembali ke halaman sebelumnya menggunakan Navigator.pop()

3. Navigation dengan Named Routes
   - Tiap halaman memiliki alamat yang disebut route
   - Perpindahan halaman menggunakan Navigator.pushNamed()
   - Kembali ke halaman sebelumnya menggunakan Navigator.pop()

   **Mendaftarkan Route**
   - Tambahkan initialRoute dan routes pada MaterialApp
   - Tiap route adalah fungsi yang membentuk halaman
     ```sh
     MaterialApp(
       debugShowCheckedModeBanner: false,

       // menentukan halaman yang pertama kali dibuka
       initialRoute: '/',

       // daftar halaman yang dapat dibuka
       routes: {
         '/' : (_) => const HomeScreen(),
         '/about' : (_) => const AboutScreen(),
       },
     );
     ```
   **Perpindahan Halaman**
   ```sh
   ElevatedButton(
     child: const Text('Go To About Page'),
     onPressed: () {

       // saat tombol di tekan
       // pindah ke halaman dengan nama /about
       Navigator.of(context).pushNamed('/about');
     },
   );
   ```
   **Mengirim Data ke Halaman Baru**

   Menggunakan arguments saat melakukan pushNamed
   ```sh
   ElevatedButton(
     child: const Text('Go To About Page'),
     onPressed: () {

       // saat tombol di tekan
       // pindah ke halaman AboutScreen dengan parameter
       Navigator.of(context).pushNamed(
         '/about',
           arguments: 'Home',
       );
     },
   );
   ```
   ```sh
   class AboutScreen extends StatelessWidget {

     // ...

     @override
     Widget build(BuildContext context) {

       // mengambil parameter yang dikirim melalui arguments
       final parameter = ModalRoute.of(context)!.settings.arguments as String;

       return ...;
     }
   }
   ```

4. Kelebihan dan Kekurangan Navigator Biasa dan Named Route

   Kelebihan
   |Navigator Biasa        |Named Route                    |
   |----------------|-------------------------------|
   |Lebih sederhana dan lebih mudah dipahami untuk aplikasi yang sederhana atau memiliki beberapa layar |Lebih mudah untuk mengeola navigasi di aplikasi yang kompleks dengan banyak layar dan perubahan status |
   |Cocok untuk aplikasi dengan hierarki navigasi yang relatif datar |Menggunakan nama untuk mengidentifikasi halaman tujuan, sehingga lebih aman terhadap perubahan nama halaman|
   | |Dapat digunakan dengan baik dengan widget MaterialApp yang mendukung pengelolaan navigasi berbasis named routes|

   Kekurangan
   |Navigator Biasa        |Named Route                    |
   |----------------|-------------------------------|
   |Sulit untuk mengelola navigasi di aplikasi yang kompleks dengan banyak layar dan perubahan status |Memerlukan sedikit pekerjaan lebih awal untuk menentukan dan mendefinisikan named routes pada saat konfigurasi aplikasi |
   |Mengharuskan penggunaan string literal untuk mengidentifikasi halaman tujuan, yang bisa berpotensi menimbulkan masalah jika ada perubahan nama halaman||
