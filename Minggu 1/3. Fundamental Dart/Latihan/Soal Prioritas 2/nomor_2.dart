// Rumus Volume Tabung
double volumeTabung(double r, double t){
  return 3.14 * r * r * t;
}


void main(){
  // Nilai dari jari-jari dan tinggi Tabung
  double jariJari = 4.0;
  double tinggi = 6;

  // Mencetak dan menghitung hasil volume Tabung
  print("Volume Tabung: ${volumeTabung(jariJari, tinggi)}");
  }