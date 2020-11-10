import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:myflutterwiget/dio/model/test_model.dart';
import 'action.dart';
import 'state.dart';

Effect<UserItemState> buildEffect() {
  return combineEffects(<Object, Effect<UserItemState>>{
    UserLisComponentAction.itemClick: _itemClick,
  });
}

void _itemClick(Action action, Context<UserItemState> ctx) {
  //跳到详情页，传值
  Results results = action.payload;
  Map<String, dynamic> map = {'data': results};
  Navigator.of(ctx.context).pushNamed('detail', arguments: map);
}
