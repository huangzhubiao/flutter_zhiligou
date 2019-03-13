import 'package:flutter/material.dart';
import '../single/themeSingle.dart';
import '../utils/CommonUtils.dart';
import '../redux/MyState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'themDetail.dart';

class PersonThemePage extends StatefulWidget {
  static String tag = 'persontheme-page';
  @override
  _PersonThemePageState createState() => _PersonThemePageState();
}

class _PersonThemePageState extends State<PersonThemePage> {

  List<ThemeItem> themes;

  @override
  void initState() {
    // TODO: implement initState
    

    themes =new List();
    ThemeItem themeItem =new ThemeItem();
    themeItem.type = 1;
    themeItem.name = '官方绿';
    themes.add(themeItem);

    ThemeItem themeItem1 =new ThemeItem();
    themeItem1.type = 2;
    themeItem1.name = '高蓝紫';
    themes.add(themeItem1);

    ThemeItem themeItem2 =new ThemeItem();
    themeItem2.type = 3;
    themeItem2.name = 'E休蓝';
    themes.add(themeItem2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<MyState>(
      builder: (context,store){

        ThemeSingelManager themeSingelManager =store.state.themeSingelManager;
        print("---------${themeSingelManager.getThemeName()}");
        return Scaffold(
          backgroundColor: Color.fromRGBO(237, 236, 242,1),
          appBar: new AppBar(
            backgroundColor: themeSingelManager.getThemeColor(),
            title: Text('中心'),
            elevation: 0,
          ),
          body: GridView.count(
            padding: EdgeInsets.all(10.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: themes.map((ThemeItem themeItem){
              return _getGridViewItemUI(context, themeItem,store);
            }).toList(),
          ),
        );
      },
    );
  }
  Widget _getGridViewItemUI(BuildContext context, ThemeItem themeItem,Store<MyState> store){
    return  InkWell(
        onTap: (){
          ThemeSingelManager themeSingelManager =ThemeSingelManager();
          themeSingelManager.setTheme(themeItem.type);
          CommonUtils.pushTheme(store, themeSingelManager);
          Navigator.of(context).push(new MaterialPageRoute(builder: (_){
            return ThemeDetailPage();
          }));
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(getThemeName(themeItem.type)),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 8,
              child: Text(themeItem.name,textAlign: TextAlign.center,),
            )
          ],
        )
        
      );
  }

  String getThemeName(int type){
    String name;
    switch (type) {
      case 1:
        name = 'images/theme_dark_green@2x.png';
        break;
      case 2:
        name = 'images/theme_purples@2x.png';
        break;
      case 3:
        name = 'images/theme_light_green@2x.png';
        break;
      default:
        name = 'images/theme_dark_green@2x.png';
    }
    return name;
  }

}

class  ThemeItem {
  int type;
  String name;
}