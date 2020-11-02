import 'package:flutter/material.dart';
import 'package:myflutterwiget/pulltorefresh/refresh_header.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class PullToRefreshDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const listCount = 30;
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
                    child: Text('下拉刷新,2s后刷新完成'),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text('item$index'),
                    color: Colors.red.withAlpha(index * 255 ~/ listCount),
                  );
                }, childCount: listCount))
              ],
            ),
            onRefresh: _onRefresh),
      ),
    );
  }

  Future<bool> _onRefresh() async {
    print('do refresh......');
    return Future.delayed(Duration(seconds: 2), () => true);
  }
}
