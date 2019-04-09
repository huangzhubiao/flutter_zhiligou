import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';
import '../../../single/themeSingle.dart';

Widget buildView(PageState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  ThemeSingelManager themeSingelManager =ThemeSingelManager();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: themeSingelManager.getThemeColor(),
      title: Text('充值中心'),
      elevation: 0,
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: RefreshIndicator(
                onRefresh: (){
                  return new Future.value();
                },
                child: ListView.builder(
                  itemBuilder: adapter.itemBuilder,
                  itemCount: adapter.itemCount)),
              )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(PageActionCreator.onAddAction()),
      tooltip: 'Add',
      child: const Icon(Icons.add),
    ),
  );
}
