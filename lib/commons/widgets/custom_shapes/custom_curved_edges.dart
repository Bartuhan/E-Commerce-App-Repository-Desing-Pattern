import 'package:flutter/material.dart';

class TCustomCurvesEdges extends CustomClipper<Path> {
  final double offset;

  TCustomCurvesEdges({super.reclip, required this.offset});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - offset);
    final lastCurve = Offset(offset, size.height - offset);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final firstCurve2 = Offset(0, size.height - offset);
    final lastCurve2 = Offset(size.width - offset, size.height - offset);
    path.quadraticBezierTo(firstCurve2.dx, firstCurve2.dy, lastCurve2.dx, lastCurve2.dy);

    final firstCurve3 = Offset(size.width, size.height - offset);
    final lastCurve3 = Offset(size.width, size.height);
    path.quadraticBezierTo(firstCurve3.dx, firstCurve3.dy, lastCurve3.dx, lastCurve3.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
