
import 'package:flutter/material.dart';


class ThemeSingelManager {
  
  int _type;
  String _name;
  String _imageName;
  Color _themeColor;

  // 工厂模式
  factory ThemeSingelManager() =>_getInstance();
  static ThemeSingelManager get instance => _getInstance();
  static ThemeSingelManager _instance;
  ThemeSingelManager._internal() {
    // 初始化
    _type = 1;
    _name = '官方绿';
    _themeColor = Color.fromRGBO(4, 41, 0, 1);
    _imageName = 'images/background.png';
  }
  static ThemeSingelManager _getInstance() {
    if (_instance == null) {
      _instance = new ThemeSingelManager._internal();
    }
    return _instance;
  }

  Color getThemeColor(){
    return _themeColor;
  }
  String getThemeName(){
    return _name;
  }

  String getImageName(){
    return _imageName;
  }

  int getType(){
    return _type;
  }

  void setTheme(int type){
    _type =type;
    switch (type) {
      case 1:{
        _name = '官方绿';
        _themeColor = Color.fromRGBO(4, 41, 0, 1);
        _imageName = 'images/background.png';

      }
        break;
    case 2:{
        _name = '高栏紫';
        _themeColor = Color.fromRGBO(25, 28, 99, 1);
        _imageName = 'images/background_purples.png';
      }
        break;
    case 3:{
        _name = 'E休蓝';
        _themeColor = Color.fromRGBO(0, 145, 178, 1);
        _imageName = 'images/background_exzd.jpg';
      }
        break;
      default:{
        _name = '官方绿';
        _themeColor = Color.fromRGBO(4, 41, 0, 1);
        _imageName = 'images/background.png';

      }
    }

  }

}