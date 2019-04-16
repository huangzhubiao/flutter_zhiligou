import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView1(
  RegisterState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue,
      child: Row(
        children: <Widget>[
          Container(
            child: const Icon(Icons.report),
            margin: const EdgeInsets.only(right: 8.0),
          ),
          Text(
            'Total ${state.telephoneNumber} tasks, ${state.code} done.',
            style: const TextStyle(fontSize: 18.0, color: Colors.white),
          )
        ],
      ));
}
