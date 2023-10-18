# Resume Materi UI Testing

## UI Testing
1. Pengertian UI Testing

   Merupakan pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna

   UI Testing di Flutter

   Disebut juga widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis

   Keuntungan UI Testing
   - Memastikan seluruh widget memberi tampilan yang sesuai
   - Memastikan seluruh interaksi dapat diterima dengan baik
   - Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

2. Melakukan UI Testing

   Instalasi Package Testing

   Pada umumnya, package testing sudah ter-install sejak project pertama kali dibuat. Tetapi cara ini dapat dilakukan, jika ingin meng-install secara manual
   ```sh
   dev_dependencies:
     flutter_test:
       sdk: flutter
   ```
   Penulisan Script Testing
   - Dilakukan pada folder test
   - Nama file harus diikuti _test.dart, contoh contact_test.dart
   
   Penulisan Script Testing
   - Tiap file berisi fungsi main() yang di dalamnya dapat dituliskan script testing
   - Tiap skenario pengujian disebut test case
   ```sh
   void main() {
     testWidgets('Judul halaman harus ...', (WidgetTester tester) async {
       // ...
     });

     testWidgets('Tombol harus ...', (WidgetTester tester) async {
       // ...
     });
   }
   ```

   Script Testing
   - Test case diawali dengan testWidgets dan diberi judul
   - Simulasi proses mengaktifkan halaman AboutScreen
   - Memeriksa apakah di halaman tersebut terdapat teks “About Screen”
   ```sh
   // 1
   testWidgets('Judul halaman harus About Screen', (WidgetTester tester) async {

     //2
     await tester.pumpWidget(
       const MaterialApp(
         home: AboutScreen(),
       ),
     );

     // 3
     expect(find.text('About Screen'), findsOneWidget);
   });
   ```

   Menjalankan Testing
   - Perintah flutter test akan menjalankan seluruh file test yang dibuat
   - Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan, dan pesan bahwa pengujian berhasil
   
   Menjalankan Testing (gagal)
   - Akan ditampilkan penyebab gagalnya pengujian

## Output Build?

1. Apa itu Output Build?
   - File/berkas hasil keluaran dari project flutter
   - Digunakan untuk merilis aplikasi ke App Store/Play Store
   - Terdiri dari format APK atau AAB untuk Android dan IPA untuk iOS
   ```sh
   flutter build apk
   flutter build appbundle
   flutter build ios
   ```

   Mode Build
   - Mode debug
     ```sh
     flutter build apk --debug
     ```
   - Mode profile
     ```sh
     flutter build apk --profile
     ```
   - Mode release
     ```sh
     flutter build apk --release
     ```

2. Build APK
   - Hanya dapat berjalan di Android
   - Memiliki format .apk
   - Dapat di install langsung pada perangkat Android
   
   Proses Sebelum Build APK
   - Mengatur nama aplikasi di AndroidManifest.xml
   - Mengatur ikon aplikasi
   - Mengatur perizinan aplikasi di AndroidManifest.xml
   
   Melakukan Build APK
   - Membuat file APK dengan mode debug, profile, dan release
     ```sh
     flutter build apk --debug
     flutter build apk --profile
     flutter build apk --release
     ```
   Output Build APK
   - Output file .apk berada di folder

     build/app/outputs/debug/app-debug.apk

     build/app/outputs/profile/app-profile.apk

     build/app/outputs/release/app-release.apk

  Install Aplikasi pada Real Device
  - Pindahkan file APK hasil build ke Smartphone Android dan lakukan proses instalasi
  - Ubah pengaturan di hp android untuk pemasangan aplikasi tidak dikenal
  - Jika ada notifikasi Play Protect diabaikan saja dan tetap install aplikasi

3. Mengatur Nama Aplikasi
   Langkah-langkah
   - Step 1: Ubah properti android:label pada AndroidManifest.xml yang ada di folder android/app/src/main/AndroidManifest.xml
   - Step 2: Stop dan Jalankan ulang aplikasi

4. Mengatur Ikon Aplikasi
   Langkah-langkah
   - Step 1: Men-generate ikon menggunakan website Android Asset Studio
   - Step 2: Download zip file hasil generate
   - Step 3: Unzip hasil download
   - Step 4: Copy seluruh folder mipmap ke project flutter
   - Step 5: Stop dan Jalankan ulang aplikasi
   
5. Mengatur Perizinan Aplikasi
   - Menambahkan tag uses-permission
   - Contoh perizinan seperti: Camera, Bluetooth, Internet, dll

6. Build IPA
   - Hasil output hanya dapat berjalan di iOS
   - Memiliki format .ipa
   - Perlu mendaftar akun Apple Developer Program
   - Perintah build hanya dapat dijalankan pada perangkat Apple
   
   Info.plist
   - Tempat konfigurasi data informasi mengenai aplikasi iOS
   - Berada di folder ios/Runner/info.plist
   - Untuk mengatur nama aplikasi, ubah nama di dalam tag string dibawah key
   - Bundle Name yang ada di info.plist
   
   Mengatur Ikon Aplikasi
   - Menggunakan website App Icon Generator
   - Unzip hasil download AppIcons.zip
   - Ganti folder AppIcon.appiconset pada folder ios/Runner/Assets.xcassets/AppIcon.appiconset
   
   Melakukan Build IPA
   - Perintah hanya dapat dijalankan pada perangkat apple/macOS
   - Hasil output terletak pada folder build/ios/archive

## Mengatur Nama Aplikasi

Package Rename
- Mengubah nama aplikasi menggunakan package Rename

Langkah-langkah
- Step 1: install package rename dengan menjalankan perintah di terminal flutter pub global activate rename
- Step 2: Jalankan perintah pada terminal flutter pub global run rename –appname “Nama Aplikasi”
- Step 3: Stop dan jalankan ulang aplikasi

## Mengatur Icon Aplikasi

Package Flutter Launcher Icons
- Mengubah ikon aplikasi menggunakan flutter_launcher_icons

Langkah-langkah
- Step 1: Buat folder assets di root project flutter
- Step 2: Pindahkan file ikon beresolusi 1024 x 1024, dari folder ic_launcher Android Asset Studio sebelumnya ke dalam folder assets
- Step 3: Tambahkan package flutter_launcher_icons di dev_dependencies (pubspec.yaml)
- Step 4: Tambahkan flutter_icons di (pubspec.yaml dibawah dev_dependencies)
- Step 5: Jalankan perintah flutter clean && flutter pub get && flutter pub run flutter_launcher_icons:main di terminal
- Step 6: Stop dan jalankan ulang aplikasi
