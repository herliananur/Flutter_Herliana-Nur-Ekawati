class Course {
  String judul;
  String deskripsi;
  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> courses = [];
  Student(this.nama, this.kelas);

  void addCourse(Course course) {
    courses.add(course);
  }

  void removeCourse(Course course) {
    courses.remove(course);
  }

  List<Course> getAllCourses() {
    return courses;
  }
}

void main() {
  var course1 = Course("Matematika", "Perhitungan Matematika");
  var course2 = Course("IPA", "Ilmu Pengetahuan Alam");

  var student1 = Student("Lia", "12");
  var student2 = Student("Ana", "11");

  student1.addCourse(course2);
  print("Student 1:");
  print("Nama: ${student1.nama}");
  print("Kelas: ${student1.kelas}");
  print("Courses:");
  student1.getAllCourses().forEach((course) {
    print("- ${course.judul}: ${course.deskripsi}");
  });

  student1.removeCourse(course1);
    print("\nStudent 1 after course removal:");
  print("Nama: ${student2.nama}");
  print("Kelas: ${student2.kelas}");
  print("Courses:");
  student1.getAllCourses().forEach((course) {
    print("- ${course.judul}: ${course.deskripsi}");
  });
}