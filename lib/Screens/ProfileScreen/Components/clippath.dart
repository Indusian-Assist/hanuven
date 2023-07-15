import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    var firstStart = Offset(w / 4, h);
    var firstEnd = Offset(w / 3, h - h / 6);

    var secondStart = Offset(w / 2, h / 2);
    var secondEnd = Offset(w * (2 / 3), h - h / 6);

    var thirdStart = Offset(w * (3 / 4), h);
    var thirdEnd = Offset(w * (10 / 12), h);

    path.moveTo(0, 0); // 1. Point
    path.lineTo(0, h); // 2. Point
    path.lineTo(w / 6, h); // 3. Point
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy); //4,5. Point
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx,
        secondEnd.dy); //6,7. Point
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy); //8,9. Point
    path.lineTo(w, h); //10. Point
    path.lineTo(w, 0); // 11. Point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
