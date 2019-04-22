import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';
import '../../single/themeSingle.dart';
import 'dart:math';

Widget buildView(RegisterState state, Dispatch dispatch, ViewService viewService) {
  ThemeSingelManager themeSingelManager =ThemeSingelManager();
  // final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: themeSingelManager.getThemeColor(),
      title: Text('注册'),
      elevation: 0,
    ),
    body: ListView.builder(
      itemCount: 60,
      itemBuilder: (BuildContext context,int index){
        return viewService.buildComponent('report');
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        int random = Random().nextInt(1000);
        state.telephoneNumber = random.toString();
        dispatch(RegisterActionCreator.modifyRegisterData(state));
      },
      tooltip: "done",
      child: const Icon(Icons.done),
    ),
  );

}