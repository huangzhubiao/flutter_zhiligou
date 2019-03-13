import 'package:flutter/material.dart';
import '../login/login_page.dart';
import '../redux/MyState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../single/themeSingle.dart';

class AcuntSet extends StatefulWidget {
  static String tag = 'acuntset-page';
  @override
  _AcuntSetState createState() => _AcuntSetState();
}

class _AcuntSetState extends State<AcuntSet> {
  @override
  Widget build(BuildContext context) {
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
          body: Center(
            child: FlatButton(
              child: Center(
                child: Text('注销'),
              ),
              onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.tag, ModalRoute.withName(LoginPage.tag));;
              },
            ),
          ),
        );
      },
    );
  }
}