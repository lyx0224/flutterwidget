import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tab of content'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('slivers'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed('sliver_demo_1');
                  },
                  child: Text('sliver'),
                ),
                RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed('sliver_demo_2');
                  },
                  child: Text('sliver2'),
                ),
                RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed('sliver_with_tab');
                  },
                  child: Text('sliver_with_tab'),
                )
              ],
            ),
            Padding(
              child: Text('page view'),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed('page_view_demo');
                  },
                  child: Text('page view'),
                )
              ],
            ),
            Padding(
              child: Text('basic wiget'),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('basic_widget');
              },
              color: Colors.pink,
              child: Text(
                'basic',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('demo_bottom_tab_bar');
              },
              color: Colors.pink,
              child: Text(
                'bottom tab bar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('text_span_demo');
              },
              color: Colors.blue,
              child: Text(
                'text span',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('pull_to_refresh_demo');
              },
              color: Colors.black,
              child: Text(
                'pull_to_refresh_demo',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('pull_to_refesh_loadmore_demo');
              },
              color: Colors.black,
              child: Text(
                'pull_to_refresh_loadmore_demo',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed('dio_demo');
              },
              child: Text('dio simple'),
            ),
            RaisedButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed('dio_demo2');
              },
              child: Text('dio pro'),
            )
          ],
        ),
      ),
    );
  }
}
