import 'package:flutter/material.dart';
import 'models/box_model.dart';

class BoxVisualizerPainter extends CustomPainter {
  final List<BoxModel> boxes;
  final double canvasHeight;

  BoxVisualizerPainter(this.boxes, this.canvasHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    const double scale = 0.792;

    for (var i = 0; i < boxes.length; i++) {
      final box = boxes[i];
      paint.color = Colors.primaries[i % Colors.primaries.length].withValues(
        alpha: 0.8,
      );

      final flippedY = canvasHeight - box.y - box.height;
      final rect = Rect.fromLTWH(
        box.x.toDouble() * scale,
        flippedY.toDouble() * scale,
        box.width.toDouble() * scale,
        box.height.toDouble() * scale,
      );

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
