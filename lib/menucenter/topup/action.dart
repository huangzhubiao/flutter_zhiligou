import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

enum TopupAction { onEdit,doneEdit,topup}

class TopupActionCreator {

  static Action onEditAction(TopupState state){
    return Action(TopupAction.onEdit,payload: state);
  }
  static Action doneEditAction(TopupState state){
    return Action(TopupAction.doneEdit,payload: state);
  }
  static Action topupAction(TopupState state){
    return Action(TopupAction.topup,payload: state);
  }
}