void main() {
  int angka = 24;
  print("Faktor dari $angka adalah:");

  for (int i = 1; i < angka; i++) {
    if (angka % i == 0) {
      print(i);
    }
  }
}
