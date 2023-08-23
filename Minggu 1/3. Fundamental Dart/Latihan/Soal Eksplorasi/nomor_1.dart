bool isPalindrom(String kata) {
  String balikKata = kata.split('').reversed.join('');
  return kata == balikKata;
}

void main() {
  String balik = "mobil balap"; //kata yang ingin dibalik dari aslinya
  bool hasil = isPalindrom(balik.replaceAll('', ''));

  if (hasil) {
    print("$balik Palindrom");
  } else {
    print("$balik Bukan Palindrom");
  }
}
