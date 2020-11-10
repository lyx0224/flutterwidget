import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:myflutterwiget/fish_redux/global_store/action.dart';
import 'package:myflutterwiget/fish_redux/global_store/global_state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
    },
  );
}

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  Color c = action.payload;
  return state.clone()..themeColor = c;
}
