class Buku {
  int id;
  String judul;
  String penerbit;
  int harga;
  String kategori;
  Buku(
    this.id,
    this.judul,
    this.penerbit,
    this.harga,
    this.kategori,
  );
}

class TokoBuku {
  List<Buku> books = [];
  void addBook(Buku buku) {
  books.add(buku);
}

void removeBook(Buku buku) {
  books.remove(buku);
}

List<Buku> getAllBooks() {
  return books;
}
}

void main() {
  var tokobuku = TokoBuku();

  var buku1 = Buku(1, "Matematika", "Math Publications", 20, "Math");
  var buku2 = Buku(2, "Fisika", "Science Publication", 30, "Science");
  var buku3 = Buku(3, "Kimia", "Science Publication", 30, "Science");

  tokobuku.addBook(buku1);
  tokobuku.addBook(buku2);
  tokobuku.addBook(buku3);

  print("Daftar Buku:");
  tokobuku.getAllBooks().forEach((book) {
    print("- ${book.judul} (ID: ${book.id})");
  });

  tokobuku.removeBook(buku2);

  print("\nBuku Setelah dihapus:");
  tokobuku.getAllBooks().forEach((book) {
    print("- ${book.judul} (ID: ${book.id})");
  });
}