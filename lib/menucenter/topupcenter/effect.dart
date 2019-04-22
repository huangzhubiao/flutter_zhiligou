import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'action.dart';

Effect<TopupCenterState> buildEffect(){

  return combineEffects(
    <Object,Effect<TopupCenterState>>{
      TopupCenterAction.initData:_initData,
      // TopupCenterAction.donePay:_donePay,
    }
  );

}

void _initData(Action action,Context<TopupCenterState> ctx){
  print('_initData');
}

void _donePay(Action action,Context<TopupCenterState> ctx){
  print('_donePay');
}