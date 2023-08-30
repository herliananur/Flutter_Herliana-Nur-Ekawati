class Hewan {
  double berat;

  Hewan({
    required this.berat,
  });
  }

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

   Mobil({
    required this.kapasitas,
  });

  void tambahMuatan(Hewan hewan) {
    double totalMuatan = muatan.fold(0, (total, hewan) => total + hewan.berat);
    if (totalMuatan + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print("Hewan ditambahkan");
    } else {
      print("Muatan tidak mencukupi");
    }
  }

  double totalMuatan() {
    double totalMuatan = muatan.fold(0, (total, hewan) => total + hewan.berat);
    return totalMuatan;
  }
}

void main() {
Mobil mobil = Mobil(
    kapasitas: 500.0,
  );
  
  Hewan hewan1 = Hewan(berat: 320.0);
  Hewan hewan2 = Hewan(berat: 200);

  mobil.tambahMuatan(hewan1);
  mobil.tambahMuatan(hewan2);

  double totalMuatan = mobil.totalMuatan();
  print("Total berat muatan: $totalMuatan kg");
  // Hewan yang ditambahkan hanya 320 kg, sedangkan 200kg hewan tidak bisa ditambahkan karena diluar dari kapasitas yang hanya 500 kg
}
