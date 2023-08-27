void main() async {
  List<List<int>> dataList = [
    [1, 5],
    [2, 10],
    [3, 15],
    [4, 20],
    [5, 25],
  ];

  var dataMap = {};

  for (var subElemen in dataList) {
    dataMap[subElemen[0]] = subElemen;
  }

  print(dataMap);
}
