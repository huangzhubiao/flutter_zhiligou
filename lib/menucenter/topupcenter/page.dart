import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TopupCenterPage extends Page<TopupCenterState,Map<String, dynamic>>{
  TopupCenterPage():super(
    initState:initState,
    effect:buildEffect(),
    reducer:buildReducer(),
    view:buildView,
  );
}