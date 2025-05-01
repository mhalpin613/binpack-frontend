import 'dart:math';
import 'models/box_model.dart';

List<BoxModel> generatePower2Boxes(int containerWidth, int containerHeight) {
  const power2 = [
    {'w': 2, 'h': 2, 'num': 256},
    {'w': 4, 'h': 4, 'num': 128},
    {'w': 8, 'h': 8, 'num': 64},
    {'w': 16, 'h': 16, 'num': 32},
    {'w': 32, 'h': 32, 'num': 16},
    {'w': 64, 'h': 64, 'num': 8},
    {'w': 128, 'h': 128, 'num': 4},
    {'w': 256, 'h': 256, 'num': 2},
  ];

  final random = Random();
  final boxes = <BoxModel>[];

  for (final entry in power2) {
    final int w = entry['w'] as int;
    final int h = entry['h'] as int;
    final int num = entry['num'] as int;

    for (int i = 0; i < num; i++) {
      boxes.add(
        BoxModel(
          width: w,
          height: h,
          x: random.nextInt(containerWidth - w),
          y: random.nextInt(containerHeight - h),
        ),
      );
    }
  }
  return boxes;
}
