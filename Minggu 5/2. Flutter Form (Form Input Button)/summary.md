# Resume Materi Flutter Form (Form Input Button)

Beberapa poin penting pada materi Flutter Form (Form Input Button) sebagai berikut:
1. Form
   - Menerima isian data dari pengguna
   - Isian data dapat lebih dari satu

   Membuat Form
   - Menggunakan StatefulWidget
   - Keadaan form disimpan menggunakan GlobalKey<FormState>
   ```sh
   var formKey = GlobalKey<FormState>();
   Form(
     key: formKey,
     child: inputWidgets);
   ```

2. Input
   Jenis-jenis input:
   - TextField
       - Menerima isian data dari pengguna
       - Isian data dapat lebih dari satu

     Membuat TextField
       - Data diambil menggunakan TextEditingController
       - Isian data berupa teks
       ```sh
       var inputController = TextEditingController();
       TextFields(
         controller: inputController);
       ```

   - Radio
       - Memberi opsi pada pengguna
       - Hanya dapat memilih satu opsi

     Membuat Radio
       - Data diambil menggunakan property dengan tipe data sesuai value pada radio
       ```sh
       var radioValue = '';
       Radio<String>(
         value: 'Laki-Laki',
         groupValue: radioValue,
         onChanged: (String? value){
           setState((){
            radioValue = value ?? '';});});
       ```

   - Checkbox
       - Memberi opsi pada pengguna
       - Dapat memilih beberapa opsi

     Membuat Checkbox
       - Data diambil menggunakan property bertipe bool
       ```sh
       var checkValue = false;
       Checkbox(
         value: checkValue,
         onChanged: (bool? value){
           setState((){
             checkValue = value ?? false;});},);
       ```

   - Dropdown Button
       - Memberi opsi pada pengguna
       - Hanya dapat memilih satu opsi
       - Opsi tidak ditampilkan di awal, hanya tampil jika ditekan

     Membuat Dropdown Button
       - Data diambil menggunakan property dengan tipe data sesuai value pada DropdownMenuItem
       ```sh
       var dropdownValue = 0;
       DropdownButton(
         value: dropdownValue,
         onChanged: (int? value){
           setState((){
             dropdownValue = value ?? 0;});},
         items: const[
            DropdownMenuItem(value: 0, child: Text('Pilih...'),),
            DropdownMenuItem(value: 1, child: Text('Satu'),),
            DropdownMenuItem(value: 2, child: Text('Dua'),),
            DropdownMenuItem(value: 3, child: Text('Tiga'),),],);
       ```

3. Button
   - Bersifat seperti tombol
   - Dapat melakukan sesuatu saat ditekan

   Jenis-jenis Button:
     - ElevatedButton
         - Tombol yang timbul
         - Jika ditekan, akan menjalankan onPressed
       ```sh
       ElevatedButton(
         child: const Text('Submit'),
         onPressed:(){},);
       ```
     - IconButton
         - Tombol yang hanya menampilkan icon
         - Jika ditekan, akan menjalankan onPressed
       ```sh
        IconButton(
         child: const Icon(Icons.add),
         onPressed:(){},);
       ```
