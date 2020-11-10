import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/basic.dart';
import 'package:myflutterwiget/fish_redux/login/Login_page/action.dart';

import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  List<Color> _color = <Color>[
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.red
  ];

  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
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
            obscureText: true,
            controller: state.pwdController,
            hit: 'password',
          ),
          Padding(
              child: Text(
                'username = 1, password = 1',
                style: TextStyle(color: Colors.red),
              ),
              padding: EdgeInsets.symmetric(vertical: 10)),
          RaisedButton(
            onPressed: () {
              dispatch(LoginActionCreator.getNavToListAction());
            },
            color: Theme.of(viewService.context).primaryColor,
            child: Text('login'),
          ),
          Padding(
            child: Text('点击色块切换主题'),
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...List.generate(_color.length, (index) {
                return ColorItem(
                  color: _color[index],
                  onTap: (c) {
                    _changeTheme(dispatch, c);
                  },
                );
              })
            ],
          )
        ],
      ),
    )),
  );
}

void _changeTheme(Dispatch dispatch, Color color) {
  dispatch(LoginActionCreator.getChangeThemeAction(color));
}

class ColorItem extends StatelessWidget {
  final Color color;
  final Function(Color) onTap;
  const ColorItem({Key key, this.color, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(color);
      },
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }
}
