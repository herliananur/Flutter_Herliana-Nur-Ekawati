void perkalian(int n) {
  for (var i = 1; i <= n; i++) {
    var baris = '';
    for (var j = 1; j <= n; j++) {
      var hasil = i * j;
      if (hasil < 10) {
        baris += '$hasil\t';
      } 
      else {
        baris += '$hasil\t';
      }
    }
    print(baris);
  }
}

void main() {
  var angka = 8;
  perkalian(angka);
}
