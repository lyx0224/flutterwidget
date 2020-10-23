import 'package:flutter/material.dart';

class SliverWithTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: false,
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
                  ],
                  expandedHeight: 200.0,
                  pinned: true,
                  //在toobar的背面
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('sliver with tab'),
                    background: Image.network(
                      'https://r-cf.bstatic.com/images/hotel/max1024x768/116/116281457.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.info),
                          text: 'tab1',
                        ),
                        Tab(
                          icon: Icon(Icons.lightbulb_outline),
                          text: 'tab2',
                        )
                      ],
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                    )))
              ];
            },
            body: TabBarView(children: [
              Container(
                color: Colors.pink,
                alignment: Alignment.center,
                child: Text('tab content1'),
              ),
              Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      child: Text('item$index'),
                      color: Colors.red.withAlpha(index * 255 ~/ 20),
                    );
                  },
                  itemCount: 20,
                ),
              )
            ])),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
