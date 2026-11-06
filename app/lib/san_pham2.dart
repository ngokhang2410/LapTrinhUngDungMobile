class SanPham2 {
  String ten;
  double gia;
  SanPham2({required this.ten, required this.gia}); // Constructor chính
  // Tạo từ dữ liệu JSON, pattern rất phổ biến khi gọi API
  SanPham2.tuJson(Map<String, dynamic> json)
    : ten = json['ten'] as String,
      gia = (json['gia'] as num).toDouble();
  // Tạo đối tượng mặc định
  SanPham2.macDinh() : ten = 'Chưa có tên', gia = 0;
  // Chuyển ngược lại sang JSON, đối xứng với tuJson
  Map<String, dynamic> toJson() => {'ten': ten, 'gia': gia};
}

var sp1 = SanPham2(ten: 'Laptop', gia: 15000000);
var sp2 = SanPham2.tuJson({'ten': 'Chuột', 'gia': 250000});


