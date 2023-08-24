void main() {
  int baris = 8;

  for (int i = 1; i <= baris; i++) {
    String jarak = ' ' * (baris - i);
    String tandaBintang = '*' * (2 * i - 1);
    print('$jarak$tandaBintang');
  }
}
