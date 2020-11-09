import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    UserListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text('列表页'),
    ),
    body: SafeArea(
        child: Container(
      alignment: Alignment.center,
      child: buildContent(state, adapter),
    )),
  );
}

Widget buildContent(UserListState state, ListAdapter adapter) {
  if (state.errMsg != null) {
    return Text(
      state.errMsg,
      style: TextStyle(color: Colors.red),
    );
  }
  return ListView.builder(
    itemBuilder: adapter.itemBuilder,
    itemCount: adapter.itemCount,
  );
}
