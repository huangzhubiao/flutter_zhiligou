import 'package:flutter/material.dart';
import 'dart:math';
import '../menucenter/menucenter.dart';
import 'package:redux/redux.dart';
import '../redux/MyState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../single/themeSingle.dart';
import '../map/mapPage.dart';
import 'painterLine.dart';


class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
  
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  double right = 0;
  double top = 0;
  double trantion1 = 0;
  double trantion2 = pi/2;
  bool isReverse =false;
  
  EdgeInsetsTween movement;

  AnimationController controller_record;
  Animation<double> animation_record;

  Animation<double> tween;
  AnimationController controller;
  Animation<double> tween1;
  AnimationController controller1;

   final _commonTween = new Tween<double>(begin: 0.0, end: 1.0);
   
  bool forward = true;

  @override
  void initState() {//初始化，当当前widget被插入到树中时调用
    super.initState();
    controller_record = new AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation_record =
        new CurvedAnimation(parent: controller_record, curve: Curves.linear);//模仿小球自由落体运动轨迹
   controller_record.forward();//放在这里开启动画 ，打开页面就播放动画
   animation_record.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller_record.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controller_record.forward();
      }
    });


    /*创建动画控制类对象*/
    controller = new AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this);

    /*创建补间对象*/
    tween = new Tween(begin: trantion1, end: trantion2)
        .animate(controller)    //返回Animation对象
      ..addListener(() {
        print("tween1 = ${tween.value}");        //添加监听
        setState(() {
          trantion1 =tween.value;
        });
      })
      ..addStatusListener((status){
          if (status == AnimationStatus.completed) {
            controller.stop();
            controller1.forward();
        }
      });

      /*创建动画控制类对象*/
    controller1 = new AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this);

    /*创建补间对象*/
    tween1 = new Tween(begin: trantion2, end: trantion1)
        .animate(controller1)    //返回Animation对象
      ..addListener(() {
        print("tween2 = ${tween1.value}");        //添加监听
        setState(() {
          trantion2 =tween1.value;
        });
      })
      ..addStatusListener((status){
          if (status == AnimationStatus.completed) {
            controller1.stop();
            controller.forward();
        }
      });

  }
  
  updateData(){
    setState(() {
      right += 1;
      top += 1;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    
    controller.dispose();
    controller1.dispose();
    controller_record.dispose();
    super.dispose();
    print("homepage dispose");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenH = MediaQuery.of(context).size.height;
    final screenW =MediaQuery.of(context).size.width;
    return StoreBuilder<MyState>(
      builder: (context,store){

        ThemeSingelManager themeSingelManager =store.state.themeSingelManager;
        return new Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,
          appBar: new AppBar(
            backgroundColor: themeSingelManager.getThemeColor(),
            elevation: 0,
            title: Container(
              width: screenW,
              margin: EdgeInsets.only(left: 0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: GestureDetector(
                      child: Image(
                        image: AssetImage('images/中心@2x.png'),
                        height: 30.0,
                        width: 30.0,
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, MenuCenter.tag);
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: (){
                        print('object');
                        Navigator.of(context).push( new MaterialPageRoute(builder:(_){
                          return new DrawPolylineScreen();
                        }));
                      },
                      child: Image(
                        image: AssetImage('images/定位@2x.png'),
                        height: 30.0,
                        width: 30.0,
                      ),
                    )
                  ),
                  Positioned(
                    right: 40.0,
                    child: Image(
                      image: AssetImage('images/狗屋@2x.png'),
                      height: 30.0,
                      width: 30.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage(themeSingelManager.getImageName()),
                fit: BoxFit.cover,
              )
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 8.0,),
                        Text(
                          'ZHILIGOU',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'ID:5000000054',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        GestureDetector(
                          onTap: (){
                            
                            if (!isReverse) {
                              if (tween.value ==pi/2) {
                                controller.reverse();
                              }else{
                                controller.forward();
                              }
                              
                              print('controller.forward()');
                            }else{
                              if (tween1.value == 0.0) {
                                controller1.reverse();
                              }else{
                                controller1.forward();
                              }
                              
                              print('controller1.forward()');
                            }
                            isReverse = !isReverse;
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Transform(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage('images/home_image.png'),
                                      width: screenW * 2 / 3,
                                      height: screenW * 2 / 3,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '50%',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.yellow,
                                            fontSize: 24.0,
                                          ),      
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          '电量',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.yellow,
                                          fontSize: 16.0,
                                          ),      
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                transform: Matrix4.identity()..rotateY(trantion1),
                                alignment: Alignment.center,
                              ),
                              GestureDetector(
                                child:Transform(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage('images/dial_dark_green.png'),
                                        width: screenW * 2 / 3,
                                        height: screenW * 2 / 3,
                                        fit: BoxFit.cover,
                                      ),
                                      Image(
                                        image: AssetImage('images/指针.png'),
                                        width: screenW * 2 / 3,
                                        height: screenW * 2 / 3,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        bottom:(screenW * 2 / 3) * 1 / 6 ,
                                        child: Text('充放功率',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                                      ),
                                      Positioned(
                                        bottom:(screenW * 2 / 3) / 4 + 4,
                                        child: Text('0w',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                                      )
                                    ],
                                  ),
                                  transform: Matrix4.identity()..rotateY(trantion2),
                                  alignment: Alignment.center,
                                ),
                                onTap: (){
                                  print('点击图片');
                                },
                              ),
                              RotationTransition(
                                turns: _commonTween.animate(controller_record),
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage(
                                    'images/update.png',
                                  ),
                                  width: screenW * 2 / 3,
                                  height: screenW * 2 / 3,
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 15,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '续航',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '8km',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '速度',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '0km/h',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  print('helloworld');
                                  Navigator.of(context).push(new MaterialPageRoute(
                                    builder:(_){
                                      return new MyPainterLine();
                                    }
                                  ));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '温度',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '25°C',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      flex: 1,
                                    )
                                  ],
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenH * 1 / 12,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/加锁--不能用@2x.png'),
                              height: 80.0,
                              width: 80.0,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              '未锁',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/灯未开@2x.png'),
                              height: 80.0,
                              width: 80.0,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              '未开灯',
                              style: TextStyle(color: Colors.white),
                              )
                          ],
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        );
      },
    );
  }
  
}