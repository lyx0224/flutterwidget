import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/fish_redux/list/UserList_page/state.dart';

import 'action.dart';

Reducer<UserListState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserListState>>{
      UserListAction.action: _onAction,
    },
  );
}

UserListState _onAction(UserListState state, Action action) {
  final UserListState newState = state.clone();
  return newState;
}
