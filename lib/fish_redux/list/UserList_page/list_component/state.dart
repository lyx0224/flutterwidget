import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

class UserItemState implements Cloneable<UserItemState> {
  Results user;
  @override
  UserItemState clone() {
    return UserItemState()..user = user;
  }
}

UserItemState initState(Map<String, dynamic> args) {
  return UserItemState();
}
