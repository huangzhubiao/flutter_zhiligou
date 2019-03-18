import 'package:flutter/material.dart';
import './widget/bottomLine.dart';
import './widget/mypainter.dart';
import '../single/themeSingle.dart';

class MyPainterLine extends StatefulWidget {
  @override
  _MyPainterLineState createState() => _MyPainterLineState();
}

class _MyPainterLineState extends State<MyPainterLine> {
int _counter = 0;
  Paint _paint;

  ScrollController _scrollController = new ScrollController();
  ScrollController _scrollController1 = new ScrollController();

  // BottomPainter bottomPainter = new BottomPainter();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _paint =new Paint()
      ..color = Colors.blueAccent
      ..strokeCap =StrokeCap.round
      ..isAntiAlias =true
      ..strokeWidth = 5.0
      ..style =PaintingStyle.stroke;
      test();
  }
  void test(){
    _scrollController.addListener((){
        setState(() {
          
          _scrollController1.jumpTo(_scrollController.offset);
        });
        
      });
  }
  @override
  Widget build(BuildContext context) {
    ThemeSingelManager themeSingelManager = ThemeSingelManager();
    double screenW =MediaQuery.of(context).size.width;
    double screenH =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeSingelManager.getThemeColor(),
        elevation: 0,
        title: Text('画线'),
      ),
      body: Container(
        width: screenW,
        height: screenH,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          ),
        ),

        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 30.0,
              width: screenW,
              child: Center(
                child: Text(
                  '温度、电流、功率变化曲线',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0
                  ),
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(left: (screenW - 240)/2,top: 40.0,),
              // margin: EdgeInsets.all(180.0),
              height: 20,
              width: 240,
              child: Center(
                child: Text(
                  DateTime.now().toString(),
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 2,top: 40.0),
              // margin: EdgeInsets.all(180.0),
              height: 20,
              width: 80,
              // color: Colors.green,
              child:Text(
                '电流、功率',
                style: TextStyle(color: Colors.white70,fontSize: 12.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: screenW - 35,top: 40.0),
              // margin: EdgeInsets.all(180.0),
              height: 20,
              width: 80,
              // color: Colors.green,
              child:Text(
                '温度',
                style: TextStyle(color: Colors.white70,fontSize: 12.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0,top: 60.0),
              // margin: EdgeInsets.all(180.0),
              height: screenH * 1 / 2,
              width: 20,
              // color: Colors.green,
              child:getwendu(screenH / 2)
            ),
            Positioned(
              right: 0,
              child: Container(
                margin: EdgeInsets.only(right: 0,top: 60.0),
                // margin: EdgeInsets.all(180.0),
                height: screenH * 1 / 2,
                width: 20,
                // color: Colors.orangeAccent,
                child:getwendu(screenH / 2), 
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(left: 21,top: 60.0),
              // margin: EdgeInsets.all(180.0),
              height: screenH * 1 / 2,
              width: screenW - 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Container(
                  // color: Colors.red,
                  width: 1000,
                  height: screenH * 1 / 2,
                  child: CustomPaint(
                    painter: new BottomPainter(screenH/2),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,top: 60 + screenH/2),
              // margin: EdgeInsets.all(180.0),
              height: 30,
              width: screenW - 40,
              // color: Colors.green,
              child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController1,
                child: Container(
                  // color: Colors.orange,
                  width: 1000,
                  height: 30,
                  child: getShuzi(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,top: screenH  / 2 + 60),
              // margin: EdgeInsets.all(180.0),
              height: 30,
              width: screenW - 40,
              color: Color.fromRGBO(255, 255, 255, 0),
            ),
            CustomPaint(
              painter: new Mypainter(screenH/2,screenW - 40),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,top: screenH  / 2 + 90),
              // margin: EdgeInsets.all(180.0),
              height: 40,
              width: screenW - 40,
              // color: Colors.lightGreen,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.red,
                        ),
                        SizedBox(width: 4,),
                        Text('温度(℃)',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.green,
                        ),
                        SizedBox(width: 4,),
                        Text('电流(A)',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 4,),
                        Text('功率(W)',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Container(
                // color: Colors.red,
                height: 50,
                width: screenW,
                child: Center(
                  child: Text(
                    '电流值为负数时：表示设备在运行状态。电流值是正数时：表示设备在充电状态.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Stack getwendu(double lenght){
    double y = lenght/14;
    Stack column = Stack(
      children: <Widget>[
        Positioned(
          top: y - 7,
          right: 3,
          child: Text('80',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*2 - 7),
          right: 3,
          child: Text('70',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*3 - 7),
          right: 3,
          child: Text('60',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*4 - 7),
          right: 3,
          child: Text('50',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*5 - 7),
          right: 3,
          child: Text('40',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*6 - 7),
          right: 3,
          child: Text('30',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*7 - 7),
          right: 3,
          child: Text('20',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*8 - 7),
          right: 3,
          child: Text('10',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*9 - 7),
          right: 3,
          child: Text('0',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*10 - 7),
          right: 3,
          child: Text('-10',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*11 - 7),
          right: 3,
          child: Text('-20',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*12 - 7),
          right: 3,
          child: Text('-30',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
        Positioned(
          top: (y*13 - 7),
          right: 3,
          child: Text('-40',textAlign: TextAlign.right,style: TextStyle(fontSize: 12.0),),
        ),
      ],
    );
    return column;
  }
  Row getShuzi(){
    Row row = new Row(
      children: <Widget>[
        Expanded(
          child: Text(
            '1',
            textAlign: TextAlign.left,
            ),
          flex: 1,
        ),
        Expanded(
          child: Text('2'),
          flex: 1,
        ),
        Expanded(
          child: Text('3'),
          flex: 1,
        ),
        Expanded(
          child: Text('4'),
          flex: 1,
        ),
        Expanded(
          child: Text('5'),
          flex: 1,
        ),
        Expanded(
          child: Text('6'),
          flex: 1,
        ),
        Expanded(
          child: Text('7'),
          flex: 1,
        ),
        Expanded(
          child: Text('8'),
          flex: 1,
        ),
        Expanded(
          child: Text('9'),
          flex: 1,
        ),
        Expanded(
          child: Text('10'),
          flex: 1,
        ),
        Expanded(
          child: Text('11'),
          flex: 1,
        ),
        Expanded(
          child: Text('12'),
          flex: 1,
        ),
        Expanded(
          child: Text('13'),
          flex: 1,
        ),
        Expanded(
          child: Text('14'),
          flex: 1,
        ),
        Expanded(
          child: Text('15'),
          flex: 1,
        ),
        Expanded(
          child: Text('16'),
          flex: 1,
        ),
        Expanded(
          child: Text('17'),
          flex: 1,
        ),
        Expanded(
          child: Text('18'),
          flex: 1,
        ),
        Expanded(
          child: Text('19'),
          flex: 1,
        ),
        Expanded(
          child: Text('20'),
          flex: 1,
        ),
        Expanded(
          child: Text('21'),
          flex: 1,
        ),
        Expanded(
          child: Text('22'),
          flex: 1,
        ),
        Expanded(
          child: Text('23'),
          flex: 1,
        ),
        Expanded(
          child: Text('0'),
          flex: 1,
        ),
      ],
    );
    return row;
  }
}