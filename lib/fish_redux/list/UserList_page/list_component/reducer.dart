import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Reducer<UserItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserItemState>>{},
  );
}
