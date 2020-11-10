import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/basic.dart';
import 'package:myflutterwiget/fish_redux/login/Login_page/action.dart';

import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('fish redux gate'),
    ),
    body: SafeArea(
        child: Container(
      child: Column(
        children: <Widget>[
          Padding(
            child: Text('欢迎使用'),
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          SearchInput(
            controller: state.userNameController,
            hit: 'username',
          ),
          SearchInput(
            controller: state.pwdController,
            hit: 'password',
          ),
          RaisedButton(
            onPressed: () {
              dispatch(LoginActionCreator.getNavToListAction());
            },
            color: Theme.of(viewService.context).primaryColor,
            child: Text('login'),
          )
        ],
      ),
    )),
  );
}
