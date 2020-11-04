import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:myflutterwiget/pulltorefresh/refresh_header.dart';
import 'package:myflutterwiget/tab_bar/pined_tabs.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class TabBarDemo3 extends StatefulWidget {
  @override
  _TabBarDemo3State createState() => _TabBarDemo3State();
}

class _TabBarDemo3State extends State<TabBarDemo3> {
  ScrollController scrollController = ScrollController();
  List<String> tabs = ["a", "b", "c", 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'demo',
            ),
          ),
          body: DefaultTabController(
            length: tabs.length,
            child: PullToRefreshNotification(
              maxDragOffset: 100.0,
              onRefresh: () => Future.delayed(Duration(seconds: 2), () => true),
              child: NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      RefreshHeader(),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          color: Colors.blue,
                          child: Text('头部，你可以自由发挥哦'),
                        ),
                      ),
                      PinedTabs(
                        tabs: tabs,
                      )
                    ];
                  },
                  body: TabBarView(
                      children: List<Widget>.generate(tabs.length, (index) {
                    if (index == 0) {
                      return ListLoadMoreContent();
                    } else if (index == 1) {
                      return ListContent();
                    } else {
                      return OtherContent();
                    }
                  }))),
            ),
          )),
    );
  }
}

class OtherContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      alignment: Alignment.center,
      child: Text('other content'),
    );
  }
}

class ListLoadMoreContent extends StatelessWidget {
  final count = 30;
  @override
  Widget build(BuildContext context) {
    return LoadMore(
        whenEmptyLoad: false,
        textBuilder: DefaultLoadMoreTextBuilder.chinese,
        //DO NOT use sliverList here.
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('loadmore item $index'),
              color: Colors.blue.withAlpha(index * 255 ~/ count),
            );
          },
          itemCount: count,
        ),
        onLoadMore: () => Future.delayed(Duration(seconds: 2), () => false));
  }
}

class ListContent extends StatelessWidget {
  final count = 30;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: 40,
          alignment: Alignment.center,
          child: Text('item $index'),
          color: Colors.blue.withAlpha(index * 255 ~/ count),
        );
      },
      itemCount: count,
    );
  }
}
