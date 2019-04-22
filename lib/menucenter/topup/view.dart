import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';
import 'action.dart';
import '../../single/themeSingle.dart';
import 'dart:ui';

Widget buildView(
  TopupState state,
  Dispatch dispatch,
  ViewService viewService
){
  ThemeSingelManager themeSingelManager = new ThemeSingelManager();
  var _deviceIDController = new TextEditingController();
  final deviceIDTextView = TextField(
      // keyboardType: TextInputType.phone,
      cursorColor: Colors.black,
      autofocus: false,
      controller: _deviceIDController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: '请输入设备号',
          hintStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.fromLTRB(8.0, 5.0, 10.0, 10.0),
          border: InputBorder.none),
    );
  return Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      backgroundColor: themeSingelManager.getThemeColor(),
      title: Text('充值中心'),
      elevation: 0,
    ),
    body:Container(
      height: window.physicalSize.height,
      width: window.physicalSize.width,
      color: Color.fromRGBO(237, 236, 242,1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            height: 50,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Center(
              child: deviceIDTextView,
            )
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 50,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Text(
                  '设备别名：智锂狗测试',
                  style: TextStyle(fontSize: 18.0),                  
                ),
              ],
            )
          ),
          Container(
            height: 40,
            width: window.physicalSize.width,
            child: Padding(
              padding: EdgeInsets.only(left: 10,top: 8),
              child: Text(
                '请选择VIP套餐',
                style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            height: 65,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Text(
                      '1年',
                      style: TextStyle(fontSize: 18.0),                  
                    ),
                    Text(
                      '30',
                      style: TextStyle(fontSize: 18.0,color: Colors.red),                  
                    ),
                    Text(
                      '元',
                      style: TextStyle(fontSize: 18.0,),                  
                    ),
                    
                  ],
                ),
                Positioned(
                  right: 10,
                  child: GestureDetector(
                    onTap: (){
                      dispatch(TopupActionCreator.topupAction(state));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.orangeAccent,
                      ) ,
                      height: 40,
                      width: 60,
                      child: Center(
                        child: Text(
                          '续费',
                          style: TextStyle(fontSize: 16.0,color: Colors.red)
                        ),
                      ),
                    ),
                  )
                )
              ],
            )
          ),
          SizedBox(height: 1,),
          Container(
            height: 65,
            width: window.physicalSize.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Text(
                      '2年',
                      style: TextStyle(fontSize: 18.0),                  
                    ),
                    Text(
                      '50',
                      style: TextStyle(fontSize: 18.0,color: Colors.red),                  
                    ),
                    Text(
                      '元',
                      style: TextStyle(fontSize: 18.0,),                  
                    ),
                    
                  ],
                ),
                Positioned(
                  right: 10,
                  child: GestureDetector(
                    onTap: (){
                      dispatch(TopupActionCreator.topupAction(state));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.orangeAccent,
                      ) ,
                      height: 40,
                      width: 60,
                      child: Center(
                        child: Text(
                          '续费',
                          style: TextStyle(fontSize: 16.0,color: Colors.red)
                        ),
                      ),
                    ),
                  )
                )
              ],
            )
          ),
          Container(
            height: 40,
            width: window.physicalSize.width,
            child: Center(
              child: Text(
                '欢迎使用智锂狗VIP充值系统',
                style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w300),
              ),
            )
          ),
        ],
      ),
    ),
    
  );
}