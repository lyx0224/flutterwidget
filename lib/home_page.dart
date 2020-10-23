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
            )
          ],
        ),
      ),
    );
  }
}
