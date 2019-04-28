import 'package:flutter/material.dart';
import 'package:zhiligou/single/themeSingle.dart';
import 'dart:math';

class MyTimerLoader extends StatefulWidget {
  @override
  _MyTimerLoaderState createState() => _MyTimerLoaderState();
}

class _MyTimerLoaderState extends State<MyTimerLoader> {
  @override
  Widget build(BuildContext context) {
    ThemeSingelManager themeSingelManager = ThemeSingelManager();
    double screenW =MediaQuery.of(context).size.width;
    double screenH =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeSingelManager.getThemeColor(),
        elevation: 0,
        title: Text('时间'),
      ),
      body: Container(
        height: screenH,
        width: screenW,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: screenW,
              width: screenW,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: new BorderRadius.circular(screenW),
              ),
              child: Stack(
                children: initSeconds(screenW, screenH).toList(),
              ),
            ),
            Container(
              height: screenW - 80,
              width: screenW - 80,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: new BorderRadius.circular(screenW - 80),
              ),
            ),
            Container(
              height: screenW - 160,
              width: screenW - 160,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: new BorderRadius.circular(screenW - 160),
              ),
            ),
            Container(
              height: screenW - 240,
              width: screenW - 240,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: new BorderRadius.circular(screenW - 240),
              ),
            )
          ],
        ),
      ),
    );
  }
  List<Widget> initSeconds(double screenW,double screenH){
    List<Widget> tiles = [];
    for(int i = 0; i <= 15; i ++){
      double testcos3 = cos((pi/2) * i/15) * (screenW / 2);
      double testsin3 = sin((pi/2) * i/15) * (screenW / 2);
      Positioned positioned3 = new Positioned(
        left: (screenW/2 + testsin3) - 10,
        top: (screenW/2) - testcos3,
        child: Transform.rotate(
          alignment: Alignment.topCenter,
          child: Container(
            height: 40,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          angle:(pi/2) * i/15,
        )
      );
      tiles.add(positioned3);
    }

    // for(int i = 0; i <= 15; i ++){
    //   double testcos3 = cos((pi/2) * i/15) * (screenW / 2);
    //   double testsin3 = sin((pi/2) * i/15) * (screenW / 2);
    //   Positioned positioned3 = new Positioned(
    //     left: (screenW/2 + testsin3) - 10,
    //     top: (screenW/2) - testcos3,
    //     child: Transform.rotate(
    //       alignment: Alignment.topCenter,
    //       child: Container(
    //         height: 40,
    //         width: 20,
    //         decoration: BoxDecoration(
    //           color: Colors.blueGrey,
    //         ),
    //       ),
    //       angle:(pi/2) * i/15,
    //     )
    //   );
    //   tiles.add(positioned3);
    // }

    return tiles;
  }
}