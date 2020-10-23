import 'package:flutter/material.dart';
import 'package:myflutterwiget/home_page.dart';
import 'package:myflutterwiget/sliver/sliver_demo1.dart';
import 'package:myflutterwiget/sliver/sliver_demo2.dart';
import 'package:myflutterwiget/sliver/sliver_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          'sliver_demo_1': (context) => SliverDemo1(),
          'sliver_demo_2': (context) => SliverDemo2(),
          'sliver_with_tab': (context) => SliverWithTab()
        },
        home: HomePage());
  }
}
