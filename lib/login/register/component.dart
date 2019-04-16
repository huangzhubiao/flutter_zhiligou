import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view1.dart';

export 'state.dart';

class RegisterComponent extends Component<RegisterState> {
  RegisterComponent()
      : super(
          view: buildView1,
          // effect: buildEffect(),
          // reducer: buildReducer(),
        );
}