import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LocationInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<LocationInfoState>>{
      LocationInfoAction.action: _onAction,
    },
  );
}

LocationInfoState _onAction(LocationInfoState state, Action action) {
  final LocationInfoState newState = state.clone();
  return newState;
}
