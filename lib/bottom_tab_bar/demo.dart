import 'package:flutter/material.dart';
import 'package:myflutterwiget/bottom_tab_bar/fancy_tab_bar.dart';

class BottomAnimaTabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Center(
        child: Text('bottom animation tab bar demo'),
      ),
      bottomNavigationBar: FancyTabBar(),
    );
  }
}
