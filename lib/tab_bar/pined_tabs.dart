import 'package:flutter/material.dart';

class PinedTabs extends StatelessWidget {
  final List<String> tabs;

  const PinedTabs({Key key, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverAppBarDelegate(TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            tabs: List<Widget>.generate(tabs.length, (index) {
              return Tab(
                child: Text(tabs[index]),
              );
            }))));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: _tabBar, color: Colors.white);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
