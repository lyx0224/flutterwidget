import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

class UserListState implements Cloneable<UserListState> {
  TestModel testModel;
  String errMsg;
  bool loading = false;

  @override
  UserListState clone() {
    return UserListState()
      ..testModel = testModel
      ..errMsg = errMsg;
  }
}

UserListState initState(Map<String, dynamic> args) {
  //初始化，避免空指针
  UserListState state = UserListState();
  state.testModel = TestModel()..results = [];
  state.loading = true;
  return state;
}
