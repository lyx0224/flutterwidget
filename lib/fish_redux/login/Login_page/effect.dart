import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:myflutterwiget/fish_redux/global_store/action.dart';
import 'package:myflutterwiget/fish_redux/global_store/global_store.dart';
import 'package:myflutterwiget/util.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.navToList: _onNavToListAction,
    LoginAction.changeTheme: _onChangeTheme
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onChangeTheme(Action action, Context<LoginState> ctx) {
  //交给GlobalStore.store分发
  GlobalStore.store
      .dispatch(GlobalActionCreator.onChangeThemeColor(action.payload));
}

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
