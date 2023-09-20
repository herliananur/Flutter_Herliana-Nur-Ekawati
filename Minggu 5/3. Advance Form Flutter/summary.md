# Resume Materi Advance Form Flutter

Beberapa poin penting pada materi Advance Form Flutter sebagai berikut:

**User Input** adalah interaksi antara aplikasi dan user dan mengumpulkan input dan feedback dari user

1. Date Picker
   - Widget dimana user bisa memasukkan tanggal (Contoh: tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll)
   
   Cara Membuat Date Picker
   - Menggunakan fungsi bawaan flutter showDatePicker
   - Fungsi showDatePicker memiliki tipe data future
   - Menampilkan dialog material design date picker
     ```sh
     final selectDate = await showDatePicker(
       context: context,
       initialDate: currentDate,
       firstDate: DateTime(1990),
       lastDate: DateTime(currentDate.year + 5),
     );
     ```
   - Menambahkan packages intl di pubspec.yaml
     ```sh
     dependencies:
      flutter:
        sdk: flutter
      intl: ^0.18.1
     ```
   - Mempersiapkan variabel
     ```sh
     class _HomePageState extends State<HomePage> {
      DateTime _dueDate = DateTime.now();
      final currentDate = DateTime.now();
     ```
   - Membangun UI
     ```sh
     Widget buildDatePicker(BuildContext context) {
      return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                  const Text('Date'),
                  TextButton(onPressed: () {},),],),
            Text(DateFormat('dd-MM-yyyy').format(_dueDate)),]);}
     ```
   - Menambahkan fungsi showDatePicker di dalam onPressed
     ```sh
     onPressed: () async {
       final selectDate = await showDatePicker(
           context: context,
           initialDate: currentDate,
           firstDate: DateTime(1990),
           lastDate: DateTime(currentDate.year + 5),
       );
     ```
   - Memanggil fungsi setState di dalam onPressed
     ```sh
     setState(() {
       if (selectDate != null) {
         _dueDate = selectDate;
       }
     });
     ```

2. Color Picker
   - Widget dimana user bisa memilih color
   - Penggunaan color picker bisa digunakan untuk berbagai macam kondisi

   Cara Membuat Color Picker
   - Menggunakan packages flutter_colorpicker
   - Menambahkan packages flutter_colorpicker di pubspec.yaml
     ```sh
     dependencies:
       flutter:
          sdk: flutter
       intl: ^0.18.1
       flutter_colorpicker: ^1.0.3
     ```
   - Mempersiapkan variabel
     ```sh
     Color _currentColor = Colors.orange;
     ```
   - Membangun UI
     ```sh
     Widget buildColorPicker(BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Text('Color'),
             const SizedBox(height: 10),
             Container(
                height: 100,
                width: double.infinity,
                color: _currentColor,
             ),
             const SizedBox(height: 10),
             Center(
                child: ElevatedButton(
                   style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(_currentColor),
                   ),
                   child: const Text('Pick Color'),
                   onPressed: () {},
             ),),],);}
     ```
   - Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog
     ```sh
      onPressed: () {
         showDialog(
             context: context,
             builder: (context) {
                 return AlertDialog(
                   title: const Text('Pick Your Color'),
                   actions: [
                     TextButton(
                        onPressed: () {
                           Navigator.pop(context);
                          },
                        child: const Text('Save'),),],);});}
     ```
   - Import packages flutter_colorpicker dalam file dart
     ```sh
     import 'package:flutter_colorpicker/flutter_colorpicker.dart';
     ```
   - Membuat kode untuk penggunaan packages flutter_colorpicker
     ```sh
     return AlertDialog(
       title: const Text('Pick Your Color'),
       content: SingleChildScrollView(
         child: SlidePicker(
           pickerColor: _currentColor,
           onColorChanged: (color) {
               setState(() {
                 _currentColor = color;});},),
     ```

3. File Picker
   - Kemampuan widget untuk mengakses storage
   - Memilih dan membuka file

    Cara Membuat File Picker
   - Menggunakan packages file_picker dan open_file
   - Menambahkan packages file_picker dan open_file di pubspec.yaml
     ```sh
     dependencies:
        flutter:
          sdk: flutter
        intl: ^0.18.1
        flutter_colorpicker: ^1.0.3
        file_picker: ^5.5.0
        open_file: ^3.3.2
     ```
   - Import packages file_picker dan open_file dalam file dart
     ```sh
     import 'package:file_picker/file_picker.dart';
     import 'package:open_file/open_file.dart';
     ```
   - Membangun UI
     ```sh
     Widget buildFilePicker() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Text('Pick Files'),
             const SizedBox(height: 10),
             Center(
                child: ElevatedButton(
                onPressed: () {},))]);}
     ```
   - Membuat fungsi untuk mengexplore dan memilih files dari storage
     ```sh
     void _pickFile() async {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;}
     ```
   - Memanggil fungsi _pickFile di dalam onPressed
     ```sh
     Center(
       child: ElevatedButton(
         child: const Text('Pick and Open File'),
         onPressed: () {
           _pickFile();
         },
       ),
     ),
     ```
   - Membuat fungsi untuk membuka files yang telah dipilih
     ```sh
     void _openFile(PlatformFile file) {
        OpenFile.open(file.path);
     }
     ```
   - Mengambil file dari object result dan memanggil fungsi _openFile di dalam fungsi _pickFile
     ```sh
     void _pickFile() async {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;

        final file = result.files.first;
        _openFile(file);
      }
     ```

4. Image Picker
   - Kemampuan widget untuk mengakses kamera
   - Kemampuan widget untuk mengambil foto dari galeri perangkat

   Cara Membuat Image Picker
   - Menggunakan packages image_picker
   - Menambahkan packages image_picker di pubspec.yaml
     ```sh
     dependencies:
       flutter:
          sdk: flutter
       image_picker: ^1.0.4
     ```
   - Import packages image_picker dalam file dart
     ```sh
     import 'package:image_picker/image_picker.dart';
     ```
   - Example
     ```sh
     final ImagePicker picker = ImagePicker();
     // Pick an image.
     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
     // Capture a photo.
     final XFile? photo = await picker.pickImage(source: ImageSource.camera);
     // Pick a video.
     final XFile? galleryVideo =
        await picker.pickVideo(source: ImageSource.gallery);
     // Capture a video.
     final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
     // Pick multiple images.
     final List<XFile> images = await picker.pickMultiImage();
     // Pick singe image or video.
     final XFile? media = await picker.pickMedia();
     // Pick multiple images and videos.
     final List<XFile> medias = await picker.pickMultipleMedia();
     ```
   - Membuat variable untuk menampung gambar
     ```sh
     class _ImagePageState extends State<ImagePage>{
        XFile? xFile;
     ```
   - Membuat widget dengan memberikan kondisi apabila variable xFile yang telah dibuat, seperti ini karena xFile belum ada nilai atau tidak ada interaksi
     ```sh
     xFile != null
          ? Image.file(
              File(
                 xFile!.path),)
          : const Icon(
              Icons.image,
              size: 240),
     ```
   - Buat fungsi untuk mengambil galeri
     ```sh
     void pickGallery() sync {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);

        if (image != null) {
           xFile = image;
           setState(() {});
        }
     }
     ```
