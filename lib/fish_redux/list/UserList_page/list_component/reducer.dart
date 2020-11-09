import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserItemState>>{
      UserListAction.action: _onAction,
    },
  );
}

UserItemState _onAction(UserItemState state, Action action) {
  final UserItemState newState = state.clone();
  return newState;
}
