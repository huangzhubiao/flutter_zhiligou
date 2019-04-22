import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

enum TopupCenterAction {initData,donePay}

class TopupCenterActionCreator {
  static Action initDataAction(){
    return Action(TopupCenterAction.initData);
  }
  static Action donePayAcion(){
    return Action(TopupCenterAction.donePay);
  }
}