import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../menucenter/acuntSetting.dart';
import '../menucenter/personTheme.dart';
import '../redux/MyState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../single/themeSingle.dart';
import 'expandablePage.dart';

class MenuCenter extends StatefulWidget {
  static String tag = 'menucenter-page';
  @override
  _MenuCenterState createState() => _MenuCenterState();
}

class _MenuCenterState extends State<MenuCenter> {
  bool _switchValue =true;
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW =MediaQuery.of(context).size.width;
    

    return StoreBuilder<MyState>(
      builder: (context,store){
        ThemeSingelManager themeSingelManager =store.state.themeSingelManager;
        return Scaffold(
          backgroundColor: Color.fromRGBO(237, 236, 242,1),
          appBar: new AppBar(
            backgroundColor: themeSingelManager.getThemeColor(),
            title: Text('中心'),
            elevation: 0,
          ),
          body: Container(
            
            child: Column(
              children: <Widget>[
                Container(
                  height: 0.05,
                  color: Colors.white,
                  width: screenW,
                ),
                GestureDetector(
                  onTap: (){
                    // print('object');
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (_){
                        return new ExpandablePage();
                      }
                    ) );
                  },
                  child: Container(
                    color: themeSingelManager.getThemeColor(),
                    height: 80,
                    width: screenW,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0,top: 10.0),
                          child: Image(
                            image: AssetImage(
                              'images/头像@2x.png',
                            ),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 80.0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'ZHILIGOU',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                'ID:500000054',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          height: 80.0,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '2019-12-30 到期',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0
                                  ),

                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                ),
                              ],
                            )

                          ),
                          
                        )
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 10.0,),
                Container(
                  height: 44.0,
                  width: screenW,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7,
                          left: 10,
                        ),
                        child: Image(
                          image: AssetImage('images/警报信息-@2x.png'),
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 48.0,),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child:Text(
                            '手机报警音',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ) 
                        
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoSwitch(
                            value: _switchValue,
                            activeColor: Colors.green,
                            onChanged: (bool newValue){
                              setState(() {
                                _switchValue = newValue;
                                print('object ${_switchValue}');
                              });
                            },
                          )
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 2.0,),
                Container(
                  height: 44.0,
                  width: screenW,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7,
                          left: 10,
                        ),
                        child: Image(
                          image: AssetImage('images/报警类型@2x.png'),
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 48.0,),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child:Text(
                            '手机报警音',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ) 
                        
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoSwitch(
                            value: _switchValue,
                            activeColor: Colors.green,
                            onChanged: (bool newValue){
                              setState(() {
                                _switchValue = newValue;
                                print('object ${_switchValue}');
                              });
                            },
                          )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 44.0,
                  width: screenW,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7,
                          left: 10,
                        ),
                        child: Image(
                          image: AssetImage('images/qq1@2x.png'),
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 48.0,),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child:Text(
                            'QQ讨论群',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ) 
                        
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.0,),
                Container(
                  height: 44.0,
                  width: screenW,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7,
                          left: 10,
                        ),
                        child: Image(
                          image: AssetImage('images/售后服务@2x.png'),
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 48.0,),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child:Text(
                            '售后服务',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ) 
                        
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 44.0,
                  width: screenW,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7,
                          left: 10,
                        ),
                        child: Image(
                          image: AssetImage('images/充值@2x.png'),
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 48.0,),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child:Text(
                            '充值中心',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ) 
                        
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.0,),
                GestureDetector(
                  onTap: (){
                    print('object');
                    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                        return new PersonThemePage();
                      }));
                  },
                  child: Container(
                    height: 44.0,
                    width: screenW,
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 7,
                            left: 10,
                          ),
                          child: Image(
                            image: AssetImage('images/theme@2x.png'),
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 48.0,),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child:Text(
                              '个性主题',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ) 
                          
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('官方绿'),
                                Icon(
                                Icons.chevron_right,
                                  color: Colors.grey,
                                )
                              ],
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                GestureDetector(
                  onTap: (){
                    print('object');
                    Navigator.pushNamed(context, AcuntSet.tag);
                  },
                  child: Container(
                    height: 44.0,
                    width: screenW,
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 7,
                            left: 10,
                          ),
                          child: Image(
                            image: AssetImage('images/设置@2x.png'),
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 48.0,),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child:Text(
                              '账户设置',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ) 
                          
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            )
                          ),
                        )
                      ],
                    ),
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