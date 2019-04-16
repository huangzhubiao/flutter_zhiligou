import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

enum RegisterAction{ 
  initRegister,
  modifyRegister,
  didModifyRegister,
  }

class RegisterActionCreator {

  static Action initRegisterData(RegisterState state){
    return Action(RegisterAction.initRegister,payload: state);
  }

  static Action modifyRegisterData(RegisterState state){
    print('object111111111111 ${state.telephoneNumber}');
    return Action(RegisterAction.modifyRegister,payload: state);
  }

    static Action didModifyRegisterData(RegisterState state){
    print('object111111111111 ${state.telephoneNumber}');
    return Action(RegisterAction.didModifyRegister,payload: state);
  }

}