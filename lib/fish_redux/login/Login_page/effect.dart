import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:myflutterwiget/util.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.navToList: _onNavToListAction
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onNavToListAction(Action action, Context<LoginState> ctx) {
  var userName = ctx.state.userNameController.text;
  var pwd = ctx.state.pwdController.text;
  println('userName: $userName , pwd" $pwd');
  if (userName.isEmpty || pwd.isEmpty) {
    showToast(ctx.context, '请输入用户名或者密码');
    return;
  }
  if (userName != '1' || pwd != '1') {
    showToast(ctx.context, '用户名密码都是1');
    return;
  }
  showToast(ctx.context, '登录成功');
  Navigator.of(ctx.context).pushNamed('user_list');
}
