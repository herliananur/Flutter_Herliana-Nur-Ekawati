Future<int> hitungFaktorialAsync(int angka) async {
  if (angka == 0 || angka == 1) {
    return 1;
  } else {
    await Future.delayed(Duration(seconds: 1));
    return angka * await hitungFaktorialAsync(angka - 1);
  }
}

Future<void> main() async {
  int angka = 5;
  int faktorial = await hitungFaktorialAsync(angka);
  print("$faktorial");
}
