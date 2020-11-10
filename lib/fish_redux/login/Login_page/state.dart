import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/fish_redux/global_store/global_state.dart';

class LoginState implements GlobalBaseState, Cloneable<LoginState> {
  TextEditingController userNameController;
  TextEditingController pwdController;

  @override
  Color themeColor;

  @override
  LoginState clone() {
    return LoginState()
      ..userNameController = userNameController
      ..pwdController = pwdController
      ..themeColor = themeColor;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state = LoginState();
  state.userNameController = TextEditingController();
  state.pwdController = TextEditingController();
  state.themeColor = Colors.blue;
  return state;
}
