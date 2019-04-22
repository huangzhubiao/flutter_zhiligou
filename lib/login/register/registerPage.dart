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
                'report0':ReportConnector() + ReportComponent(),
                'report1':ReportConnector() + ReportComponent(),
                'report3':ReportConnector() + ReportComponent(),
                'report2':ReportConnector() + ReportComponent(),
                'report4':ReportConnector() + ReportComponent(),
                'report5':ReportConnector() + ReportComponent(),
                'report6':ReportConnector() + ReportComponent(),
                'report7':ReportConnector() + ReportComponent(),
                'report8':ReportConnector() + ReportComponent(),
                'report9':ReportConnector() + ReportComponent(),
                'report':ReportConnector() + ReportComponent(),
              }
            ),
          middlewares: <Middleware<RegisterState>>[
            logMiddleware(tag: 'TodoEditPage'),
          ],
        );
}