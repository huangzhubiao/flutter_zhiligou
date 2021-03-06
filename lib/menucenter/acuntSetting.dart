import 'package:flutter/material.dart';
import '../login/login_page.dart';
import '../redux/MyState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../single/themeSingle.dart';
import 'web.dart';

class AcuntSet extends StatefulWidget {
  static String tag = 'acuntset-page';
  @override
  _AcuntSetState createState() => _AcuntSetState();
}

class _AcuntSetState extends State<AcuntSet> {
  @override
  Widget build(BuildContext context) {
    double screenW =MediaQuery.of(context).size.width;
    return StoreBuilder<MyState>(
      builder: (context,store){
        ThemeSingelManager themeSingelManager = store.state.themeSingelManager;
        return Scaffold(
          backgroundColor: Color.fromRGBO(237, 236, 242,1),
          appBar: new AppBar(
            backgroundColor: themeSingelManager.getThemeColor(),
            title: Text('中心'),
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: screenW,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Material(
                        borderRadius: BorderRadius.circular(50.0),
                        elevation: 3.0,
                        child: Image(
                          image: AssetImage('images/jiao_0.png'),
                          height: 60,
                          width: 60,
                        ),
                      )
                    ),
                    Positioned(
                      left: 90,
                      child: Text('智锂狗GPS',style: TextStyle(fontSize: 24.0),)
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: screenW,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('修改密码',style: TextStyle(fontSize: 20.0),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: screenW,
                color: Colors.white,
                child: GestureDetector(
                  onTap: (){
                    print('object');
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (_){
                        return new WebBrowser();
                      }
                    ));
                  },
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('产品说明',style: TextStyle(fontSize: 20.0),),
                      ),
                    ],
                  ),
                )
              ),
              SizedBox(height: 2,),
              Container(
                height: 60,
                width: screenW,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('关于',style: TextStyle(fontSize: 20.0),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: screenW,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('清空缓存',style: TextStyle(fontSize: 20.0),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: screenW,
                color: Colors.white,
                child: Center(
                  child: FlatButton(
                    child: Center(
                      child: Text('注销用户',style: TextStyle(fontSize: 18.0,color: Colors.red),),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.tag, ModalRoute.withName(LoginPage.tag));
                    },
                  ),
                ),
              )
            ],
          )
        );
      },
    );
  }
}