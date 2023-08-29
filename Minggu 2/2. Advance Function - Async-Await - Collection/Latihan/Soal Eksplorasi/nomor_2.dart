void main() {
  List<String> input = ["js", "js", "js", "golang", "python", "js", "js", "golang", "rust"];
  
  Map<String, int> frekuensi = {};

  input.forEach((data) {
    frekuensi.update(data, (nilai) => nilai + 1, ifAbsent: () => 1);
  });

  frekuensi.forEach((data, jumlah) {
    print('$data: $jumlah');
  });
}
