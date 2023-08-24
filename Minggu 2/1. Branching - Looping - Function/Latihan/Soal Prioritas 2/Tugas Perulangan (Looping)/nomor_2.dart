void main() {
  int baris = 5;

  for (int i = 1; i <= baris; i++) {
    String jarak = ' ' * (i - 1);
    String tandaBintang = '*' * (2 * (baris - i) + 1);
    print('$jarak$tandaBintang');
  }

  for (int i = baris - 1; i >= 1; i--) {
    String jarak = ' ' * (i - 1);
    String tandaBintang = '*' * (2 * (baris - i) + 1);
    print('$jarak$tandaBintang');
  }
}
