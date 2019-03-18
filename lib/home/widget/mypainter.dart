import 'package:flutter/material.dart';

class Mypainter extends CustomPainter {

  Paint _paint = new Paint()
      ..color = Colors.white54
      ..strokeCap =StrokeCap.round
      ..isAntiAlias =true
      ..strokeWidth = 2.0
      ..style =PaintingStyle.stroke;

  double top = 60;
  double lenght;
  double width;
  Mypainter(double lenght,double width){
    this.lenght = lenght;
    this.width = width;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawLine(Offset(20.0, top), Offset(20.0, lenght + top), _paint);
    canvas.drawLine(Offset(20.0, lenght + top), Offset(width + 20, lenght + top), _paint);
    canvas.drawLine(Offset(width + 20, top), Offset(width + 20, lenght + top), _paint);
    canvas.drawLine(Offset(15.0, top + 10), Offset(20.0, top), _paint);
    canvas.drawLine(Offset(25.0, top + 10), Offset(20.0, top), _paint);
    canvas.drawLine(Offset(width + 20 - 5, top + 10), Offset(width + 20, top), _paint);
    canvas.drawLine(Offset(width +20 + 5, top + 10), Offset(width + 20, top), _paint);

    double y = lenght / 14;
    for (var i = 0; i < 14; i++) {
      if (i == 0) {
        continue;
      }
      canvas.drawLine(Offset(20.0, top + i * y), Offset(30.0,top + i * y), _paint);
    }
    for (var i = 0; i < 14; i++) {
      if (i == 0) {
        continue;
      }
      canvas.drawLine(Offset(width + 10, top + i * y), Offset(width + 20,top + i * y), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  
}