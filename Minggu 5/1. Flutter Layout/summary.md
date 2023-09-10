# Resume Materi Flutter Layout

Beberapa poin penting pada materi Flutter Layout sebagai berikut:

Layout berfungsi untuk mengatur tata letak dan berbentuk widget yang mengatur widget di dalamnya.

Ada 2 jenis Layout:
1. Single-child Layout

   Widget ini hanya memiliki 1 buah child saja.

   Macam-macam Single-child Layout sebagai berikut:

   **Container**
   - Membuat sebuah box
   - Membungkus widget lain
   - Box memiliki margin, padding, dan border

    **Center**
   - Membuat sebuah box
   - Membungkus widget lain
   - Memenuhi lebar dan tinggi ruang di luarnya
   - Meletakkan widget berada di bagian tengah

    **SizedBox**
   - Membuat sebuah box
   - Membungkus widget lain
   - Box dapat diatur lebar dan tingginya
   - Lebih sederhana dari container

2. Multi-child Layout

   Meletakkan child widget lebih dari 1 dan menggunakan properti children yang tipenya array

   Macam-macam Multi-child Layout sebagai berikut:

   **Column**
   - Mengatur widgets secara vertikal
     
   **Row**
   - Mengatur widgets secara horizontal
     
   **ListView**
   - Mengatur widgets dalam bentuk list
   - Memiliki kemampuan scroll

    Macam-macam ListView
     - ListView adalah jenis ListView paling dasar yang digunakan untuk menampilkan daftar item dalam daftar list secara vertikal
    ```sh
    @override
    Widget build(BuildContext context) {
    return const ListView(children: <Widget>[
      ListTile(
        title: Text(
          'Item 1',
        ),
      ),ListTile(
        title: Text(
          'Item 2',
        ),
      ),ListTile(
        title: Text(
          'Item 3',),),]);}
    ```
     - ListView.builder

       Digunakan ketika Anda memiliki daftar item yang panjang atau dinamis.
    ```sh
    @override
    Widget build(BuildContext context) {
    return const ListView(children: [
      ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Text('$index');},)]);}
    ```

     - ListView.separated

       Digunakan untuk menambahkan pemisah setiap item dalam daftar
    ```sh
    @override
    Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length, 
      separatorBuilder: (context, index) => const Divider(), 
      itemBuilder: (context, index) {
      return ListTile(title: Text(items[index]),);},);}}
    ```
    
     - ListView.custom

       Memberikan lebih banyak kontrol atas cara item ditampilkan dalam daftar. Cocok untuk kasus yang kompleks di mana ingin menyesuaikan tata letak item.
    ```sh
    @override
    Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text(
            items[index],),)));}
    ```

      Kapan menggunakan ListView?

   ListView:
    - Cocok untuk daftar dengan sedikit item
    - Semua item dimuat ke dalam widget tree sekaligus, yang dapat mempengaruhi perfoma jika daftar sangat besar
    
    ListView.builder:
    - Lebih efisien daripada ListView dasar karena hanya membangun item yang terlihat di layar
    - Cocok untuk daftar yang panjang atau dinamis
    
    ListView.separated:
    - Sama efisiennya dengan ListView.builder karena hanya membangun item yang terlihat
    - Cocok ketika anda perlu memisakan item dengan widget seperti Divider
    
    ListView.custom:
    - Memberi anda lebih banyak kontrol atas tata letak item dan pemrosesan tampilan item
    - Cocok untuk tampilan yang kompleks, tetapi perlu dikelola dengan hati-hati agar tidak mengorbankan performa
    
    **GridView**
      - Mengatur widgets dalam bentuk galeri
     
      Macam-macam GridView
     - GridView.count

       Memungkinkan untuk membuat tampilan berbasis grid dengan jumlah baris dan kolom yang tetap. Dapat dikontrol jumlah baris dan kolom dengan parameter crossAxisCount
    ```sh
     @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2, 
        children: List.generate(10, 
        (index) => Image.network('', fit: BoxFit.cover,)),));}
    ```
 
     - GridView.builder

       Digunakan ketika memiliki daftar item yang panjang atau dinamis yang ingin ditampilkan dalam tampilan berbasis grid. Ini membangun item hanya saat diperlukan, yang efisien
    ```sh
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2), 
          itemBuilder: BuildContext context, int index){
            return const GridTile(child: Text('AA'));});}
     
  - GridView.extent

    Memungkinkan untuk membuat tampilan berbasis grid dengan item yang memiliki lebar atau tinggi yang tetap. Dapat mengontrol ukuran lebar atau tinggi item dengan parameter maxCrossAxisExtent
    ```sh
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 150, 
        children: List.generate(10, (index) => Image.network('', fit: BoxFit.cover,)),));}
         
  - GridView.custom

    Memberi lebih banyak kontrol atas cara item ditampilkan dalam tampilan berbasis grid. Cocok untuk kasus yang kompleks di mana ingin menyesuaikan tata letak item
    ```sh
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150), 
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => 
            return Text('aaaaa'))));}
