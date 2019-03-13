import 'package:flutter/material.dart';
import 'ThemeRedux.dart';
import '../single/themeSingle.dart';

class MyState {
  
  ThemeSingelManager themeSingelManager;

  MyState({this.themeSingelManager});

}

MyState appReducer(MyState state,action){
  return MyState(
    themeSingelManager: ThemeDataReducer(state.themeSingelManager,action),
  );
}