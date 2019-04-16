import 'package:fish_redux/fish_redux.dart';
import './register_component/state.dart';

class RegisterState implements Cloneable<RegisterState>{
  String telephoneNumber;
  String code;
  @override
  RegisterState clone() {
    // TODO: implement clone
    return RegisterState()
          ..telephoneNumber = telephoneNumber
          ..code = code;
  }
}

RegisterState initState(Map<String,dynamic> arc){
  return RegisterState();
}

class ReportConnector extends ConnOp<RegisterState, ReportState> {
  @override
  ReportState get(RegisterState state) {
    final ReportState reportState = ReportState();
    reportState.total = state.telephoneNumber;
    reportState.done = state.code;
    print('ReportConnector');
    return reportState;
  }

  @override
  void set(RegisterState state, ReportState subState) {}
}