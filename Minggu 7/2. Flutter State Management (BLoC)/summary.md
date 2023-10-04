# Resume Materi Flutter State Management (BLoC)

Beberapa poin penting pada materi Flutter State Management (BLoC) sebagai berikut

1. Deskripsi:
   - BLoc (Business Logic Component)
   - Memisahkan antara business logic dengan UI

2. Kenapa BLoC?
   - Simple, mudah untuk digunakan
   - Powerful, dapat mempercepat proses tertentu
   - Testable, mudah untuk dilakukan pengujian

3. Cara Kerja BLoC
   - Menerima event sebagai input
   - Dianalisa dan di kelola di dalam BLoc
   - Menghasil state sebagai output

4. Source (Sumber)

   **Source** adalah sumber data atau input dalam pola BLoC. Ini bisa menjadi entitas yang menghasilkan data, seperti sumber API, sensor perangkat, atau bahkan input pengguna. Sumber ini menghasilkan aliran data yang akan diteruskan ke dalam BLoC.
   
5. Stream

   **Stream** adalah aliran berkelanjutan dari data yang berasal dari sumber. Dalam konteks BLoC, stream digunakan untuk meneruskan data dari sumber ke BLoC. Stream berfungsi sebagai saluran yang mengalirkan data dari sumber ke komponen berikutnya, yaitu Sink.
   - Rangkaian proses secara asynchronous
   - Actor utama di dalam BLoc

6. Sink

   **Sink** adalah tempat di mana data dikonsumsi atau diterima dalam BLoC. Ini digunakan untuk mengirimkan perintah atau tindakan dari antarmuka pengguna atau komponen lain ke BLoC untuk diproses. Misalnya, ketika pengguna menekan tombol di antarmuka pengguna, perintah tersebut dikirmkan ke Sink BLoC untuk dieksekusi dalam logika bisnis.
