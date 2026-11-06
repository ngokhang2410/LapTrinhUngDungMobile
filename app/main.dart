import 'dart:io';

void main() {
  print('=== CHƯƠNG TRÌNH THỐNG KÊ ĐIỂM SINH VIÊN ===\n');

  // 1. Nhập số lượng và điểm số trung bình của từng sinh viên
  stdout.write('Nhập số lượng sinh viên trong lớp: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('Số lượng sinh viên không hợp lệ!');
    return;
  }

  List<double> scores = [];
  for (int i = 0; i < n; i++) {
    while (true) {
      stdout.write('Nhập điểm sinh viên thứ ${i + 1} (0 - 10): ');
      double? score = double.tryParse(stdin.readLineSync() ?? '');
      if (score != null && score >= 0 && score <= 10) {
        scores.add(score);
        break;
      } else {
        print('Điểm không hợp lệ! Vui lòng nhập số trong khoảng 0 đến 10.');
      }
    }
  }

  print('\n----------------------------------------');

  // 2. Tính điểm trung bình của cả lớp
  double sum = scores.reduce((a, b) => a + b);
  double classAverage = sum / scores.length;

  // 3. Tìm điểm lớn nhất và nhỏ nhất
  double maxScore = scores.reduce((a, b) => a > b ? a : b);
  double minScore = scores.reduce((a, b) => a < b ? a : b);

  print('Điểm trung bình của lớp : ${classAverage.toStringAsFixed(2)}');
  print('Điểm cao nhất            : $maxScore');
  print('Điểm thấp nhất           : $minScore');

  // 4. Thống kê Histogram (Biểu đồ phân bố điểm từ 0 đến 10)
  print('\n--- THỐNG KÊ HISTOGRAM (Phân bố điểm) ---');

  // Tạo 10 mảng đếm tương ứng các khoảng [0-1), [1-2), ..., [9-10]
  List<int> histogram = List.filled(10, 0);

  for (double score in scores) {
    int index = score.floor();
    if (index == 10) index = 9; // Điểm 10 tròn được gom vào khoảng [9 - 10]
    histogram[index]++;
  }

  for (int i = 0; i < 10; i++) {
    String rangeLabel = (i == 9) ? '[ 9.0 - 10.0]' : '[ ${i}.0 -  ${i + 1}.0)';
    String bar = '█' * histogram[i]; // Ký tự vẽ biểu đồ cột
    print('$rangeLabel : ${histogram[i]} SV \t $bar');
  }
}
