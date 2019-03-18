import 'package:flutter/material.dart';
import 'dart:math';

class BottomPainter extends CustomPainter {

  bool ispainted;
  double lenght;
  BottomPainter(double lenght){
    this.lenght =lenght;
  }

  Paint _paint = new Paint()
      ..color = Colors.white54
      ..strokeCap =StrokeCap.round
      ..isAntiAlias =true
      ..strokeWidth = 2.0
      ..style =PaintingStyle.stroke;
    Paint _paintline = new Paint()
    ..color = Colors.yellowAccent[100]
    ..strokeCap =StrokeCap.round
    ..isAntiAlias =true
    ..strokeWidth = 2.0
    ..style =PaintingStyle.stroke;
  Paint _paint1 = new Paint()
      ..color = Colors.orangeAccent
      ..strokeCap =StrokeCap.round
      ..isAntiAlias =true
      ..strokeWidth = 2.0
      ..style =PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    ispainted =true;
    // TODO: implement paint
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), _paint);
    double x =size.width / 24;
    for (var i = 0; i < 24; i++) {
      canvas.drawLine(Offset(i * x, size.height), Offset(i * x, size.height - 10), _paint);
    }

    List<double> list =new List<double>();
    list.add(30.0);
    list.add(60.0);
    list.add(20.0);
    list.add(50.0);
    list.add(30.0);
    list.add(-30.0);
    list.add(20.0);
    list.add(40.0);
    list.add(0.0);
    list.add(10.0);
    list.add(-20.0);
    list.add(70.0);
    list.add(40.0);
    list.add(50.0);
    list.add(30.0);
    list.add(-30.0);
    list.add(20.0);
    list.add(40.0);
    list.add(0.0);
    list.add(10.0);
    list.add(-20.0);
    list.add(70.0);
    list.add(40.0);
    list.add(40.0);

    double y = lenght / 14;
    for (int i = 0; i < 23; i++) {
      
      // int random = Random().nextInt(13);
      double tmp =list[i];
      double tmp2 =list[i + 1];

    double height = 0;
    double height2 = 0;
    if (tmp == 80) {
      height = 0 * y;
    }else if(tmp == 70){
      height = 1 * y;
    }else if(tmp == 60){
      height = 2 * y;
    }else if(tmp == 50){
      height = 3 * y;
    }else if(tmp == 40){
      height = 4 * y;
    }else if(tmp == 30){
      height = 5 * y;
    }else if(tmp == 20){
      height = 6 * y;
    }else if(tmp == 10){
      height = 7 * y;
    }else if(tmp == 0){
      height = 8 * y;
    }else if(tmp == -10){
      height = 9 * y;
    }else if(tmp == -20){
      height = 11 * y;
    }else if(tmp == -30){
      height = 12 * y;
    }else if(tmp == -40){
      height = 13 * y;
    }
    if (tmp2 == 80) {
      height2 = 0 * y;
    }else if(tmp2 == 70){
      height2 = 1 * y;
    }else if(tmp2 == 60){
      height2 = 2 * y;
    }else if(tmp2 == 50){
      height2 = 3 * y;
    }else if(tmp2 == 40){
      height2 = 4 * y;
    }else if(tmp2 == 30){
      height2 = 5 * y;
    }else if(tmp2 == 20){
      height2 = 6 * y;
    }else if(tmp2 == 10){
      height2 = 7 * y;
    }else if(tmp2 == 0){
      height2 = 8 * y;
    }else if(tmp2 == -10){
      height2 = 9 * y;
    }else if(tmp2 == -20){
      height2 = 11 * y;
    }else if(tmp2 == -30){
      height2 = 12 * y;
    }else if(tmp2 == -40){
      height2 = 13 * y;
    }

      canvas.drawLine(Offset(i * x, height), Offset((i + 1) * x, height2), _paintline);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    if (ispainted ==true) {
      return false;
    }else{
      return true;
    }
    return true;
  }
  
}