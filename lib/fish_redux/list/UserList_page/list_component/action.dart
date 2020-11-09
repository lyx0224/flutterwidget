import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserListAction { action }

class UserListActionCreator {
  static Action onAction() {
    return const Action(UserListAction.action);
  }
}
