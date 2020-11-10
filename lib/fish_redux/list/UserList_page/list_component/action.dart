import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserListAction { action }

class UserListComponentActionCreator {
  static Action onAction() {
    return const Action(UserListAction.action);
  }
}
