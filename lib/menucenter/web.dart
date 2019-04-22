import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import '../single/themeSingle.dart';
//"http://gprs.syxzlg.com/about.html"
class WebBrowser extends StatefulWidget {
  @override
  _WebBrowserState createState() => _WebBrowserState();
}

class _WebBrowserState extends State<WebBrowser> {
  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: "http://gprs.syxzlg.com/about.html", androidToolbarColor: Colors.deepPurple);
  }
  @override
  Widget build(BuildContext context) {
    ThemeSingelManager themeSingelManager = ThemeSingelManager();
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 236, 242,1),
          appBar: new AppBar(
            backgroundColor: themeSingelManager.getThemeColor(),
            title: Text('产品说明'),
            elevation: 0,
          ),
          body: new Center(
          child: new RaisedButton(
            onPressed: () => openBrowserTab(),
            child: new Text('Open Flutter website'),
          ),
        ),
    );
  }
}