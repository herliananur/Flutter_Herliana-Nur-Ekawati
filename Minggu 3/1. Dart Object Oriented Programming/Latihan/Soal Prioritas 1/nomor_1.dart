class Hewan {
  double berat; 
  Hewan({
    required this.berat,
  });

  void printBerat() {
    print("Berat hewan: $berat kg");
  }
}

void main() {
  Hewan hewan = Hewan(berat: 50.0);
  hewan.printBerat();
}
