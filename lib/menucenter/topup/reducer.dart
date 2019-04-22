import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'action.dart';

Reducer<TopupState> buildReducer(){
  return asReducer(
    <Object,Reducer<TopupState>>{
      TopupAction.onEdit:_onEdit,
    }
  );
}

TopupState _onEdit(TopupState state,Action action){
  TopupState editState = action.payload;
  return editState;
}