import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import './effect.dart';
import './reducer.dart';
import 'state.dart';
import 'view.dart';
import 'component.dart';
import './register_component/component.dart';
class RegisterPage extends Page<RegisterState, Map<String, dynamic>>{
  RegisterPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RegisterState>(
              // adapter: ToDoListAdapter(),
              slots: <String, Dependent<RegisterState>>{
                'report':ReportConnector() + ReportComponent(),
              }
            ),
          middlewares: <Middleware<RegisterState>>[
            logMiddleware(tag: 'TodoEditPage'),
          ],
        );
}