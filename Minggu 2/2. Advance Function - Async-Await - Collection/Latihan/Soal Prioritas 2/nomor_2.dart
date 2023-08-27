void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int sum = 0;
  for (var i = 0; i < nilai.length; i++) {
    sum += nilai[i];
  }

  double rataRata = sum / nilai.length;
  int pembulatan = (rataRata + 0.5).toInt();

  print(pembulatan);
}