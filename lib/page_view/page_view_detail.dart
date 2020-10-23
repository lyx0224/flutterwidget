import 'package:flutter/material.dart';

class PageViewDetail extends StatefulWidget {
  final int index;

  final String url;

  const PageViewDetail({this.index, this.url});

  @override
  _PageViewDetailState createState() => _PageViewDetailState();
}

class _PageViewDetailState extends State<PageViewDetail> {
  @override
  Widget build(BuildContext context) {
    var index = widget.index;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('detail: $index'),
            expandedHeight: 200.0,
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.url,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  [_createImageInfoWidget(), _createListWidget()]))
        ],
      ),
    );
  }

  Widget _createImageInfoWidget() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Hero(
            tag: widget.index,
            child: Image.network(
              widget.url,
              height: 200,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: Colors.pink,
            height: 200,
            child: Text('other'),
          ),
        )
      ],
    );
  }

  Widget _createListWidget() {
    return Container(
      height: 600,
      alignment: Alignment.center,
      child: Text('other'),
      color: Colors.blue,
    );
  }
}
