import 'dart:collection';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/basic.dart';
import 'package:myflutterwiget/bottom_tab_bar/demo.dart';
import 'package:myflutterwiget/dio/dio_demo.dart';
import 'package:myflutterwiget/fish_redux/detail/Detail_page/page.dart';
import 'package:myflutterwiget/fish_redux/global_store/global_state.dart';
import 'package:myflutterwiget/fish_redux/global_store/global_store.dart';
import 'package:myflutterwiget/fish_redux/list/UserList_page/page.dart';
import 'package:myflutterwiget/fish_redux/login/Login_page/page.dart';
import 'package:myflutterwiget/home_page.dart';
import 'package:myflutterwiget/page_view/pag_view_demo.dart';
import 'package:myflutterwiget/page_view/page_view_detail.dart';
import 'package:myflutterwiget/paint/paint_demo.dart';
import 'package:myflutterwiget/paint/paint_demo2.dart';
import 'package:myflutterwiget/pulltorefresh/pull_to_refresh_demo.dart';
import 'package:myflutterwiget/pulltorefresh/pull_to_refresh_loadmore_demo.dart';
import 'package:myflutterwiget/sliver/sliver_demo1.dart';
import 'package:myflutterwiget/sliver/sliver_demo2.dart';
import 'package:myflutterwiget/sliver/sliver_tab.dart';
import 'package:myflutterwiget/tab_bar/tab_bar_demo.dart';
import 'package:myflutterwiget/tab_bar/tab_bar_demo2.dart';
import 'package:myflutterwiget/tab_bar/tab_bar_demo3.dart';
import 'package:myflutterwiget/textspan/text_span_demo.dart';

import 'dio/dio_demo2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //fish-redux路由表
  final AbstractRoutes fishReduxRoutes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'login_page': LoginPage(),
        'user_list': UserListPage(),
        'detail': DetailPage()
      },
      visitor: (String name, Page<Object, dynamic> page) {
        if (page.isTypeof<GlobalBaseState>()) {
          page.connectExtraStore(GlobalStore.store,
              // AppStore.state 变化时, PageStore.state 该如何变化
              (Object pageState, GlobalState appState) {
            GlobalBaseState p = pageState;
            if (p.themeColor != appState.themeColor) {
              if (pageState is Cloneable) {
                final GlobalBaseState newState =
                    pageState.clone() as GlobalBaseState;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }
            return pageState;
          });
        }
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme:
              TextTheme(title: TextStyle(color: Colors.white, fontSize: 14.0)),
          primaryColor: Colors.blueAccent,
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          'sliver_demo_1': (context) => SliverDemo1(),
          'sliver_demo_2': (context) => SliverDemo2(),
          'sliver_with_tab': (context) => SliverWithTab(),
          'page_view_demo': (context) => PageViewDemo(),
          'basic_widget': (context) => BasicWiget(),
          'demo_bottom_tab_bar': (context) => BottomAnimaTabBarDemo(),
          'text_span_demo': (context) => TextSpanDemo(),
          'pull_to_refresh_demo': (context) => PullToRefreshDemo(),
          'pull_to_refesh_loadmore_demo': (context) =>
              PullToRefreshLoadMoreDemo(),
          'dio_demo': (context) => DioDemo(),
          'dio_demo2': (context) => DioDemo2(),
          'tab_bar_demo': (context) => TabBarDemo(),
          'tab_bar_demo2': (context) => TabBarDemo2(),
          'tab_bar_demo3': (context) => TabBarDemo3(),
          'paint_demo': (context) => PaintDemo(),
          'paint_demo2': (context) => PaintDemo2()
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
          } else {
            return MaterialPageRoute(
                builder: (context) =>
                    fishReduxRoutes.buildPage(setting.name, setting.arguments));
          }
        },
        home: HomePage());
  }
}
