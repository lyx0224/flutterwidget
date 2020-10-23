import 'package:flutter/material.dart';

class SliverDemo1 extends StatelessWidget {
  int count = 15;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: <Widget>[
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
              ],
              expandedHeight: 200.0,
              pinned: true,
              //在toobar的背面
              flexibleSpace: FlexibleSpaceBar(
                title: Text('FlexibleSpaceBar'),
                background: Image.network(
                  'https://r-cf.bstatic.com/images/hotel/max1024x768/116/116281457.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                color: Colors.yellowAccent,
                alignment: Alignment.center,
                child: Text('我从BoxConstraint变成了SliverConstraint'),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          child: Text(
                            'item$index',
                          ),
                          alignment: Alignment.center,
                          height: 100,
                          color: Colors.red.withAlpha(index * 255 ~/ count),
                        ),
                    childCount: count))
          ],
        ),
      ),
    );
  }
}
