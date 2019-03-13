import 'package:flutter/material.dart';
import 'login/login_page.dart';
import 'home/homePage.dart';
import 'menucenter/menucenter.dart';
import 'menucenter/acuntSetting.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/MyState.dart';
import 'single/themeSingle.dart';
import 'package:amap_base/amap_base.dart';

// void main() => runApp(MyApp());
void main() async{
  await AMap.init('f627a6fad85e5dd76fd10a318bf7ea99');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes = <String,WidgetBuilder>{
    HomePage.tag: (context) => HomePage(), 
    MenuCenter.tag: (context) => MenuCenter(),
    AcuntSet.tag: (context) => AcuntSet(),
    LoginPage.tag: (context) => LoginPage(),
  };
  final store = new Store<MyState>(
    appReducer,
    initialState: new MyState(
      themeSingelManager: new ThemeSingelManager(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new LoginPage(),
        routes: routes,
      ),
    );
  }
}
