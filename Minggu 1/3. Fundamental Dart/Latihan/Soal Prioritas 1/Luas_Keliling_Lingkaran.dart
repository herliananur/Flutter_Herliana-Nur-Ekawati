// Rumus Keliling Lingkaran
double kelilingLingkaran(double r){
  return 2 * 3.14 * r;
}

// Rumus Luas Lingkaran
double luasLingkaran(double r){
  return 3.14 * r * r;
}

void main(){
  // Nilai dari jari-jari lingkaran
  double jariJari = 4.0;

  // Mencetak dan menghitung hasil keliling dan luas Lingkaran
  print("Keliling Lingkaran: ${kelilingLingkaran(jariJari)}");
  print("Luas Lingkaran: ${luasLingkaran(jariJari)}");
  }