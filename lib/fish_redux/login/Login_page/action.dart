import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum LoginAction { action, navToList, changeTheme }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action getNavToListAction() {
    return const Action(LoginAction.navToList);
  }

  static Action getChangeThemeAction(Color c) {
    return Action(LoginAction.changeTheme, payload: c);
  }
}
