import 'package:fish_redux/fish_redux.dart';
import '../component.dart';

enum ToDoListAction { add }

class ToDoListActionCreator {
  static Action add(ToDoState state) {
    print('object111111111111 ${state.title}');
    return Action(ToDoListAction.add, payload: state);
  }
}
