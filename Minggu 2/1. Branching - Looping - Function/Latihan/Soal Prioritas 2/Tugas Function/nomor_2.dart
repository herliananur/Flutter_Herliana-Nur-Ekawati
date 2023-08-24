int hitungFaktorial(int angka) {
  if (angka == 0 || angka == 1) {
    return 1;
  } else {
    return angka * hitungFaktorial(angka - 1);
  }
}

void main() {
  List<int> angka = [10, 40, 50];
  for (int i = 0; i < angka.length; i++) {
    int faktorial = hitungFaktorial(angka[i]);
    print("Faktorial dari ${angka[i]} adalah $faktorial");
  }
}