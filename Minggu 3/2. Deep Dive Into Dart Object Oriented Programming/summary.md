# Resume Materi Deep Dive Into Dart Object Oriented Programming

Beberapa poin penting pada materi Deep Dive Into Dart Object Oriented Programming sebagai berikut:

1. Constructor
   - Method yang dijalankan saat pembuatan object
   - Dapat menerima parameter
   - Tidak memiliki return
   - Nama sama dengan nama class

2. Inheritance
   - Membuat class baru dengan memanfaatkan class yang sudah ada
   - Bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru

3. Overriding
   - Menulis ulang method yang ada pada super-class
   - Bertujuan agar class memiliki method yang sama, dengan yang berbeda

   Melakukan Overriding
   - Dilakukan pada class yang melakukan inheritance
   - Method sudah ada pada class induk
   - Method ditulis ulang seperti membuat method baru pada class anak
   - Ditambahkan tanda @override di baris sebelum method dibuat

4. Interface
   - Berupa class
   - Menunjukkan method apa saja yang ada pada suatu class
   - Seluruh method wajib di-override
   - Digunakan dengan menggunakan implements

   Menggunakan Interface
   - Sekilas mirip inheritance
   - Pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class induk

5. Abstract Class
   - Berupa class abstrak
   - Menunjukkan method apa saja yang ada pada suatu class
   - Digunakan dengan menggunakan extends
   - Tidak dapat dibuat object
   - Tidak semua method harus di-override

6. Polymorphism
   - Kemampuan data berubah menjadi bentuk lain
   - Tipe data yang dapat digunakan adalah super class
   - Dapat dilakukan pada class dengan extends atau implements

7. Generics
   - Dapat digunakan pada class atau fungsi
   - Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda
   - Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi
