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
              children: <Widget>[
                RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: () {
                    Navigator.of(context).pushNamed('sliver_demo_1');
                  },
                  child: Text('sliver'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
