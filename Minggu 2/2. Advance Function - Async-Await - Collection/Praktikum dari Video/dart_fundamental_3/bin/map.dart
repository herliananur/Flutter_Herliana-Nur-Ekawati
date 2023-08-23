// void main() {
//   var student = {};
//   student['name'] = 'Alex Under';
//   student['age'] = 16;
//   print(student);

//   print(student['name']);
//   print(student['age']);
// }

void main() {
  var student = {
    'name': 'Alex Under',
    'age': 16,
  };
  print(student);

  for (var key in student.keys) {
    print(student[key]);
  }
}
