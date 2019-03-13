import 'package:flutter/material.dart';
import '../home/homePage.dart';
import '../single/themeSingle.dart';

class LoginPage extends StatefulWidget {
  
  static String tag = 'login-page';

  @override
  _LoginPageState createState() {
    // TODO: implement createState
    return new _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {
  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();
  ThemeSingelManager themeManager =ThemeSingelManager();
  @override
  Widget build(BuildContext context) {

    final screenH = MediaQuery.of(context).size.height;
    final screenW =MediaQuery.of(context).size.width;

    final email = TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _userNameController,
      decoration: InputDecoration(
          hintText: '手机号',
          contentPadding: EdgeInsets.fromLTRB(2.0, 5.0, 10.0, 10.0),
          border: InputBorder.none),
    );

    final password = TextField(
      autofocus: false,
      controller: _userPassController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(2.0, 5.0, 10.0, 10.0),
          border: InputBorder.none),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {
          String text =email.controller.text;
          print("----${text}");
          Navigator.of(context).pushNamedAndRemoveUntil(HomePage.tag, ModalRoute.withName(HomePage.tag));
          // Navigator.of(context)
        },
        padding: EdgeInsets.only(left: screenW/2 - 50,top: 10.0,bottom: 10.0,right: screenW/2 - 50),
        color: Colors.green,
        child: Text('登录', style: TextStyle(color: Colors.white,fontSize: 18.0)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: themeManager.getThemeColor(),
        elevation: 0,
        title: new Row(
          children: <Widget>[
            Expanded(
              child: Text(''),
              flex: 1,
            ),
            Expanded(
              child: Text(
                '登陆',
                textAlign: TextAlign.center,
                ),
              flex: 1,
            ),
            Expanded(
              child: Text(
                '注册',
                textAlign: TextAlign.right,
                ),
              flex: 1,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage(themeManager.getImageName()),
            fit: BoxFit.cover,
          )
        ),
        child: Stack(
        alignment: const FractionalOffset(0.0, 0.0),
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Image(
                  image: new AssetImage('images/banner.png'),
                ),
                
                SizedBox(height: 2.0),
                Container(
                  width: screenW,
                  padding: EdgeInsets.only(left: 10.0,right: 20.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 0.0),
                        child: Image(
                          image: AssetImage('images/手机号.png'),
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40.0),
                        height: 40.0,
                        child: email,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 1.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  color: Colors.white54,
                  height: 1,
                  width: screenW - 20,
                ),
                SizedBox(height: 20.0),
                Container(
                  width: screenW,
                  padding: EdgeInsets.only(left: 10.0,right: 20.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 0.0),
                        child: Image(
                          image: AssetImage('images/密码.png'),
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40.0),
                        height: 40.0,
                        child: password,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  color: Colors.white54,
                  height: 1,
                  width: screenW - 20,
                ),
                SizedBox(height: 24.0),
                loginButton,
                Container(
                  width: screenW,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text('记住密码',textAlign: TextAlign.left,),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 50.0),
                          child: Text('忘记密码',textAlign: TextAlign.right,),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50.0,
            child: Container(
              width: screenW,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0,right: 0.0),
                          decoration: BoxDecoration(
                            
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.0),
                                Color.fromRGBO(255, 255, 255, 0.5),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight
                            )
                          ),
                          height: 1,
        
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text('第三方登陆',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0)),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0,right: 0.0),
                          decoration: BoxDecoration(
                            
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.0),
                                Color.fromRGBO(255, 255, 255, 0.5),
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft
                            )
                          ),
                          height: 1,
        
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    
                    children: <Widget>[
                      Expanded(
                        child: Text('微信登录',textAlign: TextAlign.center,),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text('qq登录',textAlign: TextAlign.center,),
                        flex: 1,
                      )
                    ],
                  )
                ],
              )
            )
          ),
        ],
      ),
      ),
    );
  }
  
}