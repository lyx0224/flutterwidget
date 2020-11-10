import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';
import 'package:myflutterwiget/fish_redux/global_store/global_state.dart';

class UserListState implements GlobalBaseState, Cloneable<UserListState> {
  TestModel testModel;
  String errMsg;
  bool loading = false;

  @override
  UserListState clone() {
    return UserListState()
      ..testModel = testModel
      ..errMsg = errMsg
      ..themeColor = themeColor;
  }

  @override
  Color themeColor;
}

UserListState initState(Map<String, dynamic> args) {
  //初始化，避免空指针
  UserListState state = UserListState();
  state.testModel = TestModel()..results = [];
  state.loading = true;
  return state;
}
