// class Hadiah<T> {
//   var isi;

// //constructor
//   Hadiah(T i) {
//     isi = i;
//   }
// }

// //object
// void main() {
//   var h1 = Hadiah<String>('Mobil');
//   print(h1.isi);

//   var h2 = Hadiah<int>(10);
//   print(h2.isi);
// }

void cekTipe<T>(T data) {
  print(data.runtimeType);
}

void main() {
  cekTipe<String>("satu");
  cekTipe<int>(1);
  cekTipe<bool>(true);
}
