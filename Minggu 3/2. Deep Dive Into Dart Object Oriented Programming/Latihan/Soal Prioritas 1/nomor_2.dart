import 'nomor_1.dart';

void main() {
  BangunRuang kubus = Kubus(10.0);
  BangunRuang balok = Balok(2.0, 3.0, 5.0);

  print('Volume Kubus: ${kubus.volume()}');
  print('Volume Balok: ${balok.volume()}');
}
