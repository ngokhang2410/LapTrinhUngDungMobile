class SanPham {
  String ten;
  int soLuongTon;
  double_gia;

  SanPham({required this.ten, required double gia, required this.soLuongTon}) // tham so bat buoc nameparameter
: _gia = gia; // this.x gán trực tiếp vào thuộc tính


double get gia => _gia; // Getter
bool get conHang => soLuongTon > 0; // Getter tính toán


set gia(double giaNew) { // Setter có kiểm soát
if (giaNew < 0) throw ArgumentError('Giá không thể âm');
_gia = giaNew;
}
}

