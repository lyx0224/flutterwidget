import 'package:flutter/material.dart';

class SliverDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
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
              )
            ];
          },
          body: Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Text('this is body'),
          )),
    );
  }
}
