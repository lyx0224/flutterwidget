import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

enum UserListAction { showListData, showErrMsg }

class UserListActionCreator {
  static Action getShowListDataAction(TestModel testModel) {
    return Action(UserListAction.showListData, payload: testModel);
  }

  static Action getShowErrMsgAction(String errMsg) {
    return Action(UserListAction.showErrMsg, payload: errMsg);
  }
}
