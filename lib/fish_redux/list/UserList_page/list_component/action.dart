import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

enum UserLisComponentAction { itemClick }

class UserListComponentActionCreator {
  static Action getItemClickAction(Results results) {
    return Action(UserLisComponentAction.itemClick, payload: results);
  }
}
