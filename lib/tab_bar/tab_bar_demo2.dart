import 'package:flutter/material.dart';
import 'package:myflutterwiget/tab_bar/tab_bar_demo.dart';

class TabBarDemo2 extends StatefulWidget {
  @override
  _TabBarDemo2State createState() => _TabBarDemo2State();
}

class _TabBarDemo2State extends State<TabBarDemo2> {
  List<Widget> contents = [];
  int index = 0;
  @override
  void initState() {
    contents
      ..add(MockTabContent(
        content: '底部tabbar可以随意画，但是内容无法滑动',
      ))
      ..add(MockTabContent(
        content: 'content1',
      ))
      ..add(MockTabContent(
        content: 'content2',
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tab bar2'),
      ),
      body: contents[index],
      bottomNavigationBar: BottomAppBar(
        child: _buildCustomerTabBar(),
      ),
      floatingActionButton: RaisedButton(
        onPressed: () {},
        child: Text('floating'),
      ),
    );
  }

  _onTabItemPressed(int index2) {
    setState(() {
      index = index2;
    });
  }

  Row _buildCustomerTabBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        CustomTabItem(
          index: 0,
          onPress: _onTabItemPressed,
          text: 'home',
          icon: Icon(Icons.home),
        ),
        CustomTabItem(
          index: 1,
          onPress: _onTabItemPressed,
          text: 'wechat',
          icon: Icon(Icons.chat),
        ),
        CustomTabItem(
          index: 2,
          text: 'profile',
          icon: Icon(Icons.android),
          onPress: _onTabItemPressed,
        )
      ],
    );
  }
}

class CustomTabItem extends StatelessWidget {
  final String text;
  final Icon icon;
  final int index;
  final ValueChanged<int> onPress;
  const CustomTabItem({
    Key key,
    this.text,
    this.icon,
    this.onPress,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 60,
        alignment: Alignment.center,
        child: IconButton(icon: icon, onPressed: () => onPress(index)),
      ),
    );
  }
}
