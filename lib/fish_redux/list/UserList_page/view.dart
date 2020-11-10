import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/widget/full_screen_loading.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    UserListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: Text('列表页'),
    ),
    body: SafeArea(
        child: Container(
      alignment: Alignment.center,
      child: state.loading
          ? FullScreenLoading()
          : buildContent(state, adapter, dispatch),
    )),
  );
}

Widget buildContent(
    UserListState state, ListAdapter adapter, Dispatch dispatch) {
  if (state.errMsg != null) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            state.errMsg,
            style: TextStyle(color: Colors.red),
          ),
          RaisedButton(
            onPressed: () {
              dispatch(UserListActionCreator.getRetryAction());
            },
            child: Text('retry'),
          )
        ],
      ),
    );
  }
  return ListView.builder(
    itemBuilder: adapter.itemBuilder,
    itemCount: adapter.itemCount,
  );
}
