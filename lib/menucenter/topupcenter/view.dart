import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';
import 'action.dart';
import '../../single/themeSingle.dart';
import 'dart:ui';

Widget buildView(
  TopupCenterState state,
  Dispatch dispatch,
  ViewService viewService,
){
  ThemeSingelManager themeSingelManager = new ThemeSingelManager();
  return Scaffold(
    resizeToAvoidBottomPadding: false,
    backgroundColor: Color.fromRGBO(237, 236, 242,1),
    appBar: AppBar(
      backgroundColor: themeSingelManager.getThemeColor(),
      title: Text('充值中心'),
      elevation: 0,
    ),
    body: Container(
      color: Color.fromRGBO(237, 236, 242,1),
      height: window.physicalSize.height,
      width: window.physicalSize.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 8,),
          Container(
            height: 50,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  left: 8,
                  child: Text("充值ID"),
                ),
                Positioned(
                  right: 8,
                  child: Text(state.deviceID),
                )
              ],
            )
          ),
          SizedBox(height: 1,),
          Container(
            height: 50,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  left: 8,
                  child: Text("设备别名"),
                ),
                Positioned(
                  right: 8,
                  child: Text(state.deviceName),
                )
              ],
            )
          ),
          SizedBox(height: 1,),
          Container(
            height: 50,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  left: 8,
                  child: Text("充值余额"),
                ),
                Positioned(
                  right: 8,
                  child: Text('￥ ${state.yearPayment} 元',style: TextStyle(color: Colors.redAccent),),
                )
              ],
            )
          ),
          Container(
            height: 40,
            width: window.physicalSize.width,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  left: 8,
                  child: Text('选择第三方支付平台',style: TextStyle(fontSize: 16.0),),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  left: 8,
                  top: 4,
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/支付宝@2x.png'),
                        height: 34,
                        width: 34,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '支付宝',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
                            ),
                          Text('推荐已安装支付宝的用户使用',style: TextStyle(fontSize: 12.0),),
                        ],
                      )
                    ],
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 4,),
          Container(
            height: 50,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  left: 8,
                  top: 4,
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/微信@2x.png'),
                        height: 34,
                        width: 34,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '微信',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
                            ),
                          Text('推荐已安装微信的用户使用',style: TextStyle(fontSize: 12.0),),
                        ],
                      )
                    ],
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          GestureDetector(
            onTap: (){
              print('object');
            },
            child: Container(
              height: 50,
              width: 250,
              decoration: new BoxDecoration(
                color: Colors.green,
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text('确认支付',style: TextStyle(fontSize: 18.0,color: Colors.white),),
              ),
            ),
          ),
          
        ],
      ),
    ),
  );
}