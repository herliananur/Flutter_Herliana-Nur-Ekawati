# Resume Materi Assets

Beberapa poin penting pada materi Assets sebagai berikut:

1. Assets
   - File yang di bundled dan di deployed bersamaan dengan aplikasi
   - Tipe-tipe assets, seperti static data (JSON files), icons, images, dan font file (ttf)

   Menentukan Assets
   - Flutter menggunakan pubspec.yaml
   - Pubspec.yaml terletak pada root project, untuk mengidentifikasi assets yang dibutuhkan aplikasi
   - Gunakan karakter “/” untuk memasukkan semua assets dibawah satu directory name

2. Image
   - Image atau gambar akan membuat tampilan aplikasi menjadi lebih menarik
   - Flutter mendukung format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP, dan WBMP
   - Menampilkan gambar dari project asset dan internet
   
   Loading Images
   - Gunakan widget Image
   - Membutuhkan properti image dengan class AssetImage()
   - Menggunakan method Image.asset, mendapatkan image yang sudah ditambahkan dalam project
   - Menggunakan method Image.network, mendapatkan data image melalui internet dengan menggunakan string url nya

3. Font
   - Penggunaan font dengan style tertentu akan menjadi keunikan pada aplikasi
   - Penentuan font yang mau dipakai biasanya oleh UI designer
   - Penerapan font menggunakan custom font atau dari package
   
   **Custom Font**

   Cara menggunakan custom font:
   - Step 1: Cari dan download font (Ex. https://fonts.google.com/)
   - Step 2: Import file .ttf
   - Step 3: Daftarkan font di pubspec.yaml
   - Step 4: Mengatur font sebagai default
   - Step 5: Gunakan font di spesifik widget
  
   **Font dari Package**

   Cara menggunakan font dari package:
   - Step 1: Tambahkan package google_fonts di dependencies
   - Step 2: Import package di file dart
   - Step 3: Gunakan font dengan memanggil GoogleFonts.namaFont()
