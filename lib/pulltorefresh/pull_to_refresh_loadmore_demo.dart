import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:myflutterwiget/pulltorefresh/refresh_header.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class PullToRefreshLoadMoreDemo extends StatefulWidget {
  @override
  _PullToRefreshLoadMoreDemoState createState() =>
      _PullToRefreshLoadMoreDemoState();
}

class _PullToRefreshLoadMoreDemoState extends State<PullToRefreshLoadMoreDemo> {
  List<int> list = [];

  int get count => list.length;

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PullToRefreshNotification(
            maxDragOffset: 100.0,
            color: Colors.blue,
            child: CustomScrollView(
              slivers: <Widget>[
                //PullToRefreshContainer(buildPulltoRefreshHeader),
                RefreshHeader(),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.yellow,
                    child: Text('下拉刷新，上拉加载更多'),
                  ),
                ),
                LoadMore(
                  whenEmptyLoad: false,
                  textBuilder: DefaultLoadMoreTextBuilder.chinese,
                  onLoadMore: _loadMore,
                  isFinish: count >= 60,
                  child: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text('item$index'),
                      color: Colors.red.withAlpha(index * 255 ~/ count),
                    );
                  }, childCount: count)),
                )
              ],
            ),
            onRefresh: _onRefresh),
      ),
    );
  }

  _load() {
    print('load');
    setState(() {
      list.addAll(List.generate(15, (v) => v));
    });
  }

  Future<bool> _onRefresh() async {
    print('do refresh......');
    await Future.delayed(Duration(seconds: 2));
    list.clear();
    _load();
    return true;
  }

  Future<bool> _loadMore() async {
    await Future.delayed(Duration(seconds: 3));
    var random = Random().nextInt(2);
    if (random == 0) {
      _load();
      //加载成功
      return true;
    } else {
      //加载失败
      return false;
    }
  }
}
