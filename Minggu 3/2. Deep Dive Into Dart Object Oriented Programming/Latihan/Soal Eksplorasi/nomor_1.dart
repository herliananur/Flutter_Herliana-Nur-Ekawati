// Interface Shape
abstract class Shape {
  double getArea();
  double getPerimeter();
}

// Implements Circle
class Circle implements Shape {
  double radius;

  Circle(this.radius);

// Luas Circle
  @override
  double getArea() {
    return (3.14 * radius * radius);
  }

// Keliling Circle
  @override
  double getPerimeter() {
    return (2 * 3.14 * radius);
  }
}

// Implements Square
class Square implements Shape {
  double side;
  Square(this.side);

// Luas Square
  @override
  double getArea() {
    return 4 * side;
  }

  // Keliling Square
  @override
  double getPerimeter() {
    return side * side;
  }
}

// Implements Rectangle
class Rectangle implements Shape {
  double width;
  double height;
  Rectangle(this.width, this.height);

// Luas Rectangle
  @override
  double getArea() {
    return width * height;
  }

  // Keliling Rectangle
  @override
  double getPerimeter() {
    return 2 * (width + height);
  }
}

void main() {
  // Hasil perhitungan Circle
  Circle circle = Circle(7.0);
  print('Luas Lingkaran: ${circle.getArea()}');
  print('Keliling Lingkaran: ${circle.getPerimeter()}');

  // Hasil perhitungan Square
  Square square = Square(4);
  print('Luas Persegi: ${square.getArea()}');
  print('Keliling Persegi: ${square.getPerimeter()}');

  // Hasil perhitungan Rectangle
  Rectangle rectangle = Rectangle(5, 2);
  print('Luas Persegi Panjang: ${rectangle.getArea()}');
  print('Keliling Persegi Panjang: ${rectangle.getPerimeter()}');
}
