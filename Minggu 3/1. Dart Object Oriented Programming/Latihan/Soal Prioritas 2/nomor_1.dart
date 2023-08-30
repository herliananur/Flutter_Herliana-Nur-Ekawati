class Calculator {
  double tambah(double a, double b) {
    return a + b;
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      return double.infinity;
    }
  }
}

void main() {
  Calculator calculator = Calculator();

  double hasilTambah = calculator.tambah(5.0, 25.0);
  double hasilKurang = calculator.kurang(10.5, 5.5);
  double hasilKali = calculator.kali(11.1, 2.0);
  double hasilBagi = calculator.bagi(3.0, 0);

  print("Hasil penjumlahan: $hasilTambah");
  print("Hasil pengurangan: $hasilKurang");
  print("Hasil perkalian: $hasilKali");
  print("Hasil pembagian: $hasilBagi");
}
