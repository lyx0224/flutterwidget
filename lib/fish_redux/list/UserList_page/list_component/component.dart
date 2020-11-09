import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserListComponent extends Component<UserItemState> {
  UserListComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<UserItemState>(
              adapter: null, slots: <String, Dependent<UserItemState>>{}),
        );
}
