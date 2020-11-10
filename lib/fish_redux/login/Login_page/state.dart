import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  TextEditingController userNameController;
  TextEditingController pwdController;

  @override
  LoginState clone() {
    return LoginState()
      ..userNameController = userNameController
      ..pwdController = pwdController;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state = LoginState();
  state.userNameController = TextEditingController();
  state.pwdController = TextEditingController();
  return state;
}
