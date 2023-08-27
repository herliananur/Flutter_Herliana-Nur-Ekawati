Future<List<int>> dataPengali(List<int> data, int pengali) async {
  List<int> hasil = [];

  for (int element in data) {
    await Future.delayed(Duration(seconds: 1));
    hasil.add(element * pengali);
  }

  return hasil;
}

void main() async {
  List<int> dataList = [1, 2, 3];
  int input = 5;

  List<int> hasilData = await dataPengali(dataList, input);
  print(hasilData);
}
