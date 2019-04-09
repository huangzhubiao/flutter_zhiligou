import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// import '../todo_edit_page/page.dart' as edit_page;
import 'action.dart';
import '../list_adapter/action.dart' as list_action;
import 'state.dart';
import '../component.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    PageAction.onAdd: _onAdd,
  });
}

void _init(Action action, Context<PageState> ctx) {
  final List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Hello world',
      desc: 'Learn how to program.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '2',
      title: 'How Fish Redux',
      desc: 'Learn how to use Fish Redux in a flutter application.',
      isDone: false,
    )
  ];

  ctx.dispatch(PageActionCreator.initToDosAction(initToDos));
}

void _onAdd(Action action, Context<PageState> ctx) {

  print('object');
  ToDoState toDo = new ToDoState();
  int random = Random().nextInt(1000);
  toDo.uniqueId = random.toString();
  toDo.title = '测试测试' + random.toString();
  toDo.desc = '测试测试测试测试测试测试测试';
  toDo.isDone = false;
  ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
  // Navigator.of(ctx.context)
  //     .push<ToDoState>(MaterialPageRoute<ToDoState>(
  //         builder: (BuildContext buildCtx) =>
  //             edit_page.TodoEditPage().buildPage(null)))
  //     .then((ToDoState toDo) {
  //   if (toDo != null &&
  //       (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
  //     ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
  //   }
  // });
}
