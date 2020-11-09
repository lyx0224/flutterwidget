import 'package:fish_redux/fish_redux.dart';

enum LoginAction { action, navToList }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action getNavToListAction() {
    return const Action(LoginAction.navToList);
  }
}
