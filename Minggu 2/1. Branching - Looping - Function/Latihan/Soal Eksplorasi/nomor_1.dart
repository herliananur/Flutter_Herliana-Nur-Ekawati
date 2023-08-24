bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

void main() {
  int num = 12;

  if (isPrime(num)) {
    print("$num adalah bilangan prima.");
  } else {
    print("$num bukan bilangan prima.");
  }
}
