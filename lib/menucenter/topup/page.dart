import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
class TopupPage extends Page<TopupState,Map<String, dynamic>>{
  TopupPage():super(
    initState:initState,
    effect:buildEffect(),
    reducer:buildReducer(),
    view:buildView,
    middlewares: <Middleware<TopupState>>[
            logMiddleware(tag: 'TopupState'),
          ],
  );
}