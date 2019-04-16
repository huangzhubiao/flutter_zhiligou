import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'action.dart';

Effect<RegisterState> buildEffect(){

  return combineEffects(<Object,Effect<RegisterState>>{
    Lifecycle.initState:_init,
    RegisterAction.modifyRegister:_modify,
  });
}

void _init(Action action, Context<RegisterState> ctx){
  RegisterState state = new RegisterState();
  state.telephoneNumber = '13427931340';
  state.code = '12306';
  ctx.dispatch(RegisterActionCreator.initRegisterData(
    state
  ));
}

void _modify(Action action, Context<RegisterState> ctx){
  
  RegisterState state = action.payload;

  print("_modify ${state.telephoneNumber}");
  ctx.dispatch(RegisterActionCreator.didModifyRegisterData(
    state
  ));
}