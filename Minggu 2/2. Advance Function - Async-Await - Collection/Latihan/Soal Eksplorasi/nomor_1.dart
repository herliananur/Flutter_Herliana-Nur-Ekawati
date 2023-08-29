List<String> hapusDuplikat(List<String> inputList) {
  return inputList.toSet().toList();
}

void main() {
  List<String> input1 = ["amuse", "tommy kaira", "spoon", "HKS", "litchfield", "amuse", "HKS"];
  List<String> output1 = hapusDuplikat(input1);
  print("Input 1: $input1");
  print("Output 1: $output1");

  List<String> input2 = ["JS Racing", "amuse", "spoon", "spoon", "JS Racing", "amuse"];
  List<String> output2 = hapusDuplikat(input2);
  print("\nInput 2: $input2");
  print("Output 2: $output2");

  List<String> input3 = ["Anggur", "Jeruk", "Mangga", "Jeruk", "Apel"];
  List<String> output3 = hapusDuplikat(input3);
  print("\nInput 2: $input3");
  print("Output 2: $output3");
}
