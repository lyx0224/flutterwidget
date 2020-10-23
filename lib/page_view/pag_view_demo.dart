import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myflutterwiget/widget/floating_card.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image =
        'https://r-cf.bstatic.com/images/hotel/max1024x768/116/116281457.jpg';
    var cardSize = (MediaQuery.of(context).size.height / 7) * 4;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${currentIndex + 1} of 5'),
            Container(
              color: Colors.red[50],
              height: cardSize,
              child: PageView.builder(
                itemCount: 5,
                //viewportFraction： pageview宽度是屏幕宽*0.8
                controller: PageController(viewportFraction: 0.8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      var map = HashMap<String, dynamic>();
                      map['index'] = index;
                      map['url'] = image;
                      Navigator.of(context)
                          .pushNamed('page_view_detail', arguments: map);
                    },
                    child: FloatingCard(
                        //Hero, 只要2个hero的tag一样即可。
                        child: Hero(
                      tag: index,
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    )),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            )
          ]),
    );
  }
}
