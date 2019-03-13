import 'package:flutter/material.dart';
import '../login/login_page.dart';
import '../redux/MyState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../single/themeSingle.dart';

class ThemeDetailPage extends StatefulWidget {
  @override
  _ThemeDetailPageState createState() => _ThemeDetailPageState();
}

class _ThemeDetailPageState extends State<ThemeDetailPage> {
  String detailImageName ;
  @override
  Widget build(BuildContext context) {

    final screenH = MediaQuery.of(context).size.height;
    final screenW =MediaQuery.of(context).size.width;
    print("pppp=${screenH}");
    return StoreBuilder<MyState>(
      builder: (context,store){
        ThemeSingelManager themeSingelManager = store.state.themeSingelManager;
        if (themeSingelManager.getType() == 1) {
          detailImageName = 'images/theme_dark_green_detail@2x.png';
        }else if(themeSingelManager.getType() == 2){
          detailImageName = 'images/theme_purples_detail@2x.png';
        }else if(themeSingelManager.getType() == 3){
          detailImageName = 'images/theme_light_green_detail@2x.png';
        }
        return Scaffold(
          backgroundColor: Color.fromRGBO(237, 236, 242,1),
          appBar: new AppBar(
            backgroundColor: themeSingelManager.getThemeColor(),
            title: Text('皮肤详情'),
            elevation: 0,
          ),
          body: Column(
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(width: 20.0,),
                  Image(
                    image: AssetImage(themeSingelManager.getImageName()),
                    height: 150.0,
                    width: 80.0,
                  ),
                  SizedBox(width: 10.0,),
                  Text(themeSingelManager.getThemeName()),
                ],
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  onPressed: () {

                  },
                  padding: EdgeInsets.only(left: screenW/2 - 50,top: 10.0,bottom: 10.0,right: screenW/2 - 50),
                  color: Colors.green,
                  child: Text('使用皮肤', style: TextStyle(color: Colors.white,fontSize: 18.0)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0,right:8.0),
                height: screenH - 370,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Image(
                    image: AssetImage(detailImageName),
                  ),
                ),
              ),
            ],
          )
        );
      },
    );
  }
}