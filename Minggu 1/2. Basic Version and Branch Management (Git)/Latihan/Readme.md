# Resume Materi Basic Version and Branch Management (Git)

Git adalah salah satu version control system populer yang digunakan para developer untuk mengembangkan software secara bersama-sama. Pemanfaat git secara terdistribusi, bukan tersentralisasi. Dibuat oleh Linus Torvalds (2005) - Linux Kernel. 

Adapun beberapa poin penting dari materi Basic Version and Branch Management (Git) sebagai berikut:
1. Setting Up
   - Git Init
     
     Perintah pada Git yang digunakan untuk membuat sebuah repository kosong pada direktori kerja lokal.
   - Git Clone

     Perintah pada Git yang digunakan untuk membuat salinan atau duplikat repository yang sudah ada.
   - Git Config

     Perintah pada Git yang digunakan untuk mengkonfigurasi pengaturan Git pada sistem lokal yang berisi informasi seperti nama pengguna dan alamat email, preferensi tampilan, preferensi warna, preferensi prompt, dan pengaturan untuk mengeksekusi perintah Git.
2. Saving Changes
   - Git Status

     Perintah pada Git yang digunakan untuk menampilkan status perubahan pada file dalam repositori, menunjukkan file mana yang telah dimodifikasi, ditambahkan, dihapus, atau belum terlacak dalam repositori.
   - Git Add

     Perintah pada Git yang digunakan untuk menambahkan file yang sudah diubah atau ditambahkan ke dalam staged changes (menjalankan perintah git add, perubahan pada file tersebut akan dimasukkan ke dalam index dan siap untuk di-commit ke dalam repositori.
   - Git Commit

     Perintah pada Git yang digunakan untuk menyimpan perubahan pada file ke dalam repositori Git yang harus disertai dengan pesan commit yang berisi deskripsi singkat tentang perubahan yang telah dilakukan pada file.
   - Git Diff

     Perintah pada Git yang digunakan untuk membandingkan perubahan pada file yang belum di-commit dengan versi sebelumnya yang telah di-commit.
   - Git Stash

     Perintah pada Git yang digunakan untuk menyimpan perubahan pada file sementara dan membersihkan working directory, sehingga dapat berpindah ke branch atau commit lain tanpa harus melakukan commit perubahan.
   - Git Ignore

     File konfigurasi pada Git yang digunakan untuk menentukan file atau direktori mana yang harus diabaikan oleh Git saat melakukan tracking atau version control. 

3. Inspecting Repository and Undoing
   - Git Log

     Perintah data Git yang digunakan untuk menampilkan log perubahan pada repositori, menampilkan daftar commit beserta informasi detailnya, seperti hash commit, author, date, dan pesan commit.
   - Git Checkout

     Perintah pada Git yang digunakan untuk pindah ke branch atau commit tertentu pada repositori, dapat digunakan untuk melihat dan mengedit file pada branch atau commit tertentu, atau untuk membuat branch baru berdasarkan branch atau commit yang sudah ada.
   - Git Reset

     Perintah pada Git yang memungkinkan pengguna untuk membatalkan perubahan pada repositori Git
       -  git reset –soft akan mengembalikan repositori ke commit sebelumnya tetapi tetap mempertahankan perubahan yang belum di commit.
       -  git reset –hard akan mengembalikan repositori ke commit sebelumnya dan menghapus semua perubahan yang belum di commit.

4. Syncing
   - Git Remote

     Perintah pada Git yang digunakan untuk mengelola dan berinteraksi dengan repositori jarak jauh (remote repositories).
   - Git Fetch dan Git Pull

     Perintah yang digunakan untuk mengambil perubahan dari repositori jarak jauh ke repositori lokal. Perbedaan utama antara git fetch dan git pull adalah git fetch hanya mengambil perubahan dari repositori jarak jauh ke repositori lokal, sementara git pull mengambil perubahan dan langsung menggabungkannya dengan cabang lokal yang sedang aktif.
   - Git Push

     Perintah yang digunakan untuk mengirimkan perubahan dari repositori lokal ke repositori jarak jauh seperti GitHub atau GitLab.
5. Branches
   - Git Branch

     Perintah yang digunakan untuk membuat, menampilkan, dan menghapus cabang di dalam repositori Git.

6. Pull Request
   - Git Merge

     Perintah yang digunakan untuk menggabungkan perubahan dari satu atau lebih cabang ke dalam cabang aktif, mengambil semua perubahan yang ada di cabang sumber dan menggabungkannya dengan cabang aktif.
