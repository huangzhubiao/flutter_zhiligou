import 'package:fish_redux/fish_redux.dart';

class ReportState implements Cloneable<ReportState> {
  String total;
  String done;

  ReportState({this.total = "123456total", this.done = "123456789done"});

  @override
  ReportState clone() {
    return ReportState()
      ..total = total
      ..done = done;
  }

  @override
  String toString() {
    return 'ReportState{total: $total, done: $done}';
  }
}
