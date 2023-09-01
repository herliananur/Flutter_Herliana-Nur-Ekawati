class Matematika {
  int hasil() {
    return 0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  int hasil() {
    return x * y ~/ hitungKPK() ;
  }
  
  int hitungKPK() {
    while (y != 0) {
      final int t = y;
      y = x % y;
      x = t;
    }
    return x;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x;
  int y;
  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  int hasil() {
    while (y != 0) {
      final int t = y;
      y = x % y;
      x = t;
    }
    return x;
  }
}
