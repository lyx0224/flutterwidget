import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserListState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserListState>>{
      UserListAction.showListData: reduceShowListData,
      UserListAction.showErrMsg: reduceShowErrorMsg
    },
  );
}

UserListState reduceShowListData(UserListState state, Action action) {
  state.loading = false;
  final UserListState newState = state.clone();
  TestModel testModel = action.payload;
  newState.testModel = testModel;
  newState.errMsg = null;
  return newState;
}

UserListState reduceShowErrorMsg(UserListState state, Action action) {
  state.loading = false;
  final UserListState newState = state.clone();
  newState.errMsg = action.payload;
  return newState;
}
