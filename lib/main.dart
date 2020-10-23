import 'package:flutter/material.dart';
import 'package:myflutterwiget/home_page.dart';
import 'package:myflutterwiget/sliver/SliverDemo1.dart';

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
          'sliver_demo_1': (context) => SliverDemo1()
        },
        home: HomePage());
  }
}
