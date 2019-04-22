import 'package:fish_redux/fish_redux.dart';

class TopupCenterState implements Cloneable<TopupCenterState>{

  String deviceID;
  String deviceName;
  String yearPayment;
  int    payType;

  TopupCenterState({this.deviceID,this.deviceName,this.yearPayment}){
  }

  @override
  TopupCenterState clone() {
    // TODO: implement clone
    return TopupCenterState()
    ..deviceID    = deviceID
    ..deviceName  = deviceName
    ..yearPayment = yearPayment
    ..payType     = 0;
    ;
  }
}

TopupCenterState initState(Map<String, dynamic> args){
  TopupCenterState state = new TopupCenterState();
  state.deviceID = '5000000054';
  state.deviceName = '智锂狗测试';
  state.yearPayment = '50';
  state.payType  = 0;
  return state;
}