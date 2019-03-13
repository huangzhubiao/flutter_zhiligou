import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../single/themeSingle.dart';

/**
 * 事件Redux
 * Created by guoshuyu
 * Date: 2018-07-16
 */

///通过 flutter_redux 的 combineReducers，实现 Reducer 方法
final ThemeDataReducer = combineReducers<ThemeSingelManager>([
  ///将 Action 、处理 Action 的方法、State 绑定
  TypedReducer<ThemeSingelManager, RefreshThemeDataAction>(_refresh),
]);

///定义处理 Action 行为的方法，返回新的 State
ThemeSingelManager _refresh(ThemeSingelManager themeData, action) {
  themeData = action.themeData;
  return themeData;
}

///定义一个 Action 类
///将该 Action 在 Reducer 中与处理该Action的方法绑定
class RefreshThemeDataAction {

  final ThemeSingelManager themeData;

  RefreshThemeDataAction(this.themeData);
}
