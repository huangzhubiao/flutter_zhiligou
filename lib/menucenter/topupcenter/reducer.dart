import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'action.dart';

Reducer<TopupCenterState> buildReducer(){
  return asReducer(
    <Object,Reducer<TopupCenterState>>{
      TopupCenterAction.donePay:_donePay,
    }
  );
}

TopupCenterState _donePay(TopupCenterState state,Action action){

  TopupCenterState newstate = new TopupCenterState();
  newstate.payType = 1;

  return newstate;
}
