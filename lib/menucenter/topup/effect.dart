import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';
import '../fish_redux/page_redux/test_redux.dart';
import '../topupcenter/page.dart';

Effect<TopupState> buildEffect(){
  return combineEffects(<Object,Effect<TopupState>>{
    // TopupAction.onEdit:_onEdit,
    TopupAction.doneEdit:_doneEdit,
    TopupAction.topup:_topup,
  });
}

void _onEdit(Action action,Context<TopupState> ctx){
  print('_onEdit');
}

void _doneEdit(Action action,Context<TopupState> ctx){
  print('_doneEdit');
}

void _topup(Action action,Context<TopupState> ctx){
  print('_topup');
  Navigator.of(ctx.context).push<TopupState>(MaterialPageRoute<TopupState>(
    builder: (_){
      return TopupCenterPage().buildPage(null);
    }
  ));
}