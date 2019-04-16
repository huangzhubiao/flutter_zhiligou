import 'package:flutter/material.dart';
import '../home/homePage.dart';
import '../single/themeSingle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './register/registerPage.dart';

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
  bool isRemenberPassword = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
    _userPassController.addListener((){
      print('${_userPassController.text}');
      updatePassword();
    });
  }
  updatePassword() async{
    if (isRemenberPassword) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('counter',_userPassController.text);
    }
  }
  initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String counter = prefs.getString('counter') ;
    if (counter.length == 0) {
      isRemenberPassword =false;
    }else{
      isRemenberPassword =true;
      _userPassController.text =counter;
    }
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW =MediaQuery.of(context).size.width;
    final email = TextField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.white,
      autofocus: false,
      controller: _userNameController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: '手机号',
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(2.0, 5.0, 10.0, 10.0),
          border: InputBorder.none),
    );

    final password = TextField(
      autofocus: false,
      controller: _userPassController,
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
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
    _incrementCounter() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String counter = prefs.getString('counter') ;
      print('Pressed $counter times.');
      if (isRemenberPassword) {
        await prefs.setString('counter', '');
        isRemenberPassword =false;
      }else{
        await prefs.setString('counter', password.controller.text);
        isRemenberPassword =true;
      }
      setState(() {
        
      });
    }
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
              child: GestureDetector(
                onTap: (){
                  print('注册');
                  Navigator.of(context).push(new MaterialPageRoute(
                     builder: (_){
                       return new RegisterPage().buildPage(<String, dynamic>{});
                     } 
                    ));
                },
                child: Text(
                  '注册',
                  textAlign: TextAlign.right,
                ),
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
                          child: InkWell(
                            onTap: (){
                              print('object');
                              _incrementCounter();
                            },
                            child: Row(
                            children: <Widget>[
                             Image(
                                image: isRemenberPassword ? AssetImage('images/选中@2x.png'):AssetImage('images/不选@2x.png'),
                                height: 16.0,
                                width: 16.0,
                              ),
                              SizedBox(width: 8,),
                              Text('记住密码',textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          )
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 50.0),
                          child: Text('忘记密码',textAlign: TextAlign.right,style: TextStyle(color: Colors.white),),
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
            bottom: 30.0,
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
                        style: TextStyle(fontSize: 18.0,color: Colors.white)),
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
                  SizedBox(height: 20,),
                  Row(
                    
                    children: <Widget>[
                      Expanded(
                        child: Image(
                          image: AssetImage('images/微信登录.png'),
                          height: 40.0,
                          width: 40.0,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child:Image(
                          image: AssetImage('images/QQ登录.png'),
                          height: 40.0,
                          width: 40.0,
                        ),
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