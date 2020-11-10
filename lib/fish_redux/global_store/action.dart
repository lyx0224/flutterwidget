import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum GlobalAction {
  changeThemeColor,
}

class GlobalActionCreator {
  static Action onChangeThemeColor(Color themeColor) {
    return Action(GlobalAction.changeThemeColor, payload: themeColor);
  }
}
