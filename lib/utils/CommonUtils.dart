import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import '../single/themeSingle.dart';
import '../redux/ThemeRedux.dart';


class CommonUtils {

  static pushTheme(Store store, ThemeSingelManager themeData) {

    store.dispatch(new RefreshThemeDataAction(themeData));
  }
}

