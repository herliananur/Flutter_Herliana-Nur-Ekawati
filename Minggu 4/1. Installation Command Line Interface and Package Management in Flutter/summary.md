# Resume Materi Installation Command Line Interface and Package Management in Flutter

Beberapa poin penting dari materi Installation Command Line Interface and Package Management in Flutter sebagai berikut:

1. **Flutter CLI** adalah alat yang digunakan untuk berinteraksi dengan Flutter SDK dan perintahnya dijalankan dalam terminal

2. Important CLI Commands:
   - Flutter Doctor

     Perintah untuk menampilkan informasi software yang dibutuhkan flutter
     ``` sh
     flutter doctor
     
   - Flutter Create

     Perintah untuk membuat project aplikasi flutter baru di directory tertentu
     ``` sh
     flutter create <APP_NAME>

   - Flutter Run

     Perintah untuk menjalankan project aplikasi di device yang tersedia
     ``` sh
     flutter run <DART_FILE_
     
   - Flutter Emulator
     
     Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru
     ```sh
     flutter emulators
     flutter emulators –launch <EMULATOR_ID>
     flutter emulators –create [--name xyz]

   - Flutter Channel

     Perintah untuk menampilkan daftar flitter channel yang tersedia dan menunjukkan channel yang digunakan saat ini
     ```sh
     flutter channel
     
    - Flutter Pub

       Ada dua syntax yang bisa digunakan, yaitu:
      1. Flutter pub add, untuk menambahkan packages ke dependencies yang ada di pubspec.yaml
         ``` sh
         flutter pub add <package_name>
         
      2. Flutter pub get, untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml
         ``` sh
         flutter pub get

    - Flutter Build

      Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publis ke AppStore, PlayStore, dll
      ``` sh
      flutter build <DIRECTORY>
      
    - Flutter Clean
      
      Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator dan perintah ini akan memperkecil ukuran project tersebut
      ``` sh
      flutter clean

3. Packages Management
   - Flutter mendukung sharing packages
   - Packages dibuat developers lain
   - Mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
   - Mendapatkan packages di website pub.dev

     Cara Menambahkan Packages
      - Cari package di pub.dev
      - Copy baris dependencies yang ada di bagian installing
      - Buka pubspec.yaml
      - Paste barisnya dibawah dependencies pubspec.yaml
      - Run flutter pub get di terminal
      - Import package di file dart agar bisa digunakan
      - Stop atau restart aplikasi jika dibutuhkan
