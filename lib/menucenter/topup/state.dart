import 'package:fish_redux/fish_redux.dart';

class TopupState implements Cloneable<TopupState>{

  String deviceID;
  String deviceName;
  String yearPayment;

  TopupState({this.deviceID,this.deviceName,this.yearPayment}){
  }

  @override
  TopupState clone() {
    // TODO: implement clone
    return TopupState()
    ..deviceID = deviceID
    ..deviceName = deviceName
    ..yearPayment = yearPayment
    ;
  }
}

TopupState initState(Map<String, dynamic> args){
  TopupState state = new TopupState();
  state.deviceID = '5000000054';
  state.deviceName = '智锂狗测试';
  state.yearPayment = '50';
  return state;
}