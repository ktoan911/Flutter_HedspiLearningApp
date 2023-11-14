import 'dart:math';

import 'package:flutter/material.dart';

class CircularPainter extends CustomPainter {
  final Color backgroundColor;
  final Color lineColor;
  final double width;
  final double percent;

  CircularPainter(
      {required this.backgroundColor,
      required this.lineColor,
      required this.width,
      required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundLine = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double sweepAngle = pi * 2 * percent; // Đây là một nửa vòng tròn (180 độ)

    // Vẽ nửa vòng tròn màu xanh (background)
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, backgroundLine);

    // Vẽ nửa vòng tròn màu trắng (complete)
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
