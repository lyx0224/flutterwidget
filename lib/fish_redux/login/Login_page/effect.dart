import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
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
  Navigator.of(ctx.context).pushNamed('user_list');
}
