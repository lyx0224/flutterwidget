import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myflutterwiget/home_page.dart';
import 'package:myflutterwiget/page_view/pag_view_demo.dart';
import 'package:myflutterwiget/page_view/page_view_detail.dart';
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
          'sliver_with_tab': (context) => SliverWithTab(),
          'page_view_demo': (context) => PageViewDemo(),
          //'page_view_detail': (context) => PageViewDetail()
        },
        //给带名字的页面传值用（Pass arguments to a named route）
        onGenerateRoute: (setting) {
          print("route name is ${setting.name}");
          if (setting.name == 'page_view_detail') {
            return MaterialPageRoute(builder: (BuildContext context) {
              var map = setting.arguments as HashMap<String, dynamic>;
              var index = map['index'];
              var url = map['url'];
              return PageViewDetail(index: index, url: url);
            });
          }
        },
        home: HomePage());
  }
}
