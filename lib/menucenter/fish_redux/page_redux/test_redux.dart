import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import './effect.dart';
import './reducer.dart';
import 'state.dart';
import '../component.dart';
import '../list_adapter/adapter.dart';
import 'view.dart';

class TestReduxPage extends Page<PageState, Map<String, dynamic>>{
  TestReduxPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PageState>(
              adapter: ToDoListAdapter(),
              // slots: <String, Dependent<PageState>>{
              //   'report': ReportComponent(),

              // }
              ),
          middlewares: <Middleware<PageState>>[
            logMiddleware(tag: 'TodoEditPage'),
          ],
        );
}

