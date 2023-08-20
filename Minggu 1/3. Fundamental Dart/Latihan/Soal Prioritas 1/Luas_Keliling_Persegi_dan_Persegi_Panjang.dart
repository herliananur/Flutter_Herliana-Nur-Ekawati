// Rumus Keliling Persegi
double kelilingPersegi(double s){
  return 4 * s;
}

// Rumus Luas Persegi
double luasPersegi(double s){
  return s * s;
}

// Rumus Keliling Persegi Panjang
double kelilingPersegiPanjang(double p, double l){
  return 2 * (p + l);
}

// Rumus Luas Persegi Panjang
double luasPersegiPanjang(double p, double l){
  return p * l;
}

void main(){
  // Nilai dari sisi, panjang, dan lebar
  double sisi = 4.0;
  double panjang = 10.5;
  double lebar = 20.0;

  // Mencetak dan menghitung hasil keliling dan luas Persegi
  print("Keliling Persegi: ${kelilingPersegi(sisi)}");
  print("Luas Persegi: ${luasPersegi(sisi)}");
  
  // Mencetak dan menghitung hasil keliling dan luas Persegi Panjang
  print("Keliling Persegi: ${kelilingPersegiPanjang(panjang, lebar)}");
  print("Luas Persegi: ${luasPersegiPanjang(panjang, lebar)}");
  
  }