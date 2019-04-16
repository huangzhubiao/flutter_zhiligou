import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
        RegisterAction.initRegister: _initRegisterReducer,
        RegisterAction.didModifyRegister:_didModifyRegisterReducer,
      },
  );
}

RegisterState _initRegisterReducer(RegisterState state,Action action){
  RegisterState newstate = action.payload ?? RegisterState;
  return newstate;
}

RegisterState _didModifyRegisterReducer(RegisterState state,Action action){
  // RegisterState newstate = action.payload ?? RegisterState;
  RegisterState newstate = state.clone();
  print('_modifyRegisterReducer ${newstate.telephoneNumber}');
  return newstate;
}