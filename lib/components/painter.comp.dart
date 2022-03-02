import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter(this.sweepAngle, this.color, this.strokeWidth);
  final double? sweepAngle;
  final Color? color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth! // 1.
      ..style = PaintingStyle.stroke // 2.
      ..color = color!; // 3.

    double degToRad(double deg) => deg * (3.14 / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * 0.7,
            width: size.width * 0.7,
          ), // 5.
          degToRad(0), // 6.
          degToRad(sweepAngle! == 0 ? 360 : sweepAngle!), // 7.
          false);

    canvas.drawPath(path, paint); // 8.
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MySecondaryPainter extends CustomPainter {
  MySecondaryPainter(
      this.sweepAngle, this.color, this.startPoint, this.strokeWidth);
  final double? sweepAngle;
  final Color? color;
  final double? startPoint;
  final double? strokeWidth;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth! // 1.
      ..style = PaintingStyle.stroke // 2.
      ..color = color!; // 3.

    double degToRad(double deg) => deg * (3.14 / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * 0.7,
            width: size.width * 0.7,
          ), // 5.
          degToRad(startPoint!), // 6.
          degToRad(sweepAngle! == 0 ? 0 : sweepAngle!), // 7.
          true);

    canvas.drawPath(path, paint); // 8.
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DotPainter extends CustomPainter {
  DotPainter({required this.color});
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 10.0 // 1.
      ..style = PaintingStyle.fill // 2.
      ..color = color!; // 3

    double degToRad(double deg) => deg * (3.14 / 180.0);
    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height,
            width: size.width,
          ), // 5.
          degToRad(120), // 6.
          degToRad(360), // 7.
          true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
