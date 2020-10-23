import 'package:flutter/material.dart';

class PageViewDetail extends StatefulWidget {
  final int index;

  final String url;

  const PageViewDetail({this.index, this.url});

  @override
  _PageViewDetailState createState() => _PageViewDetailState();
}

class _PageViewDetailState extends State<PageViewDetail>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _moveAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    _moveAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var index = widget.index;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.accessible), onPressed: null)
            ],
            expandedHeight: 200.0,
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('index is $index'),
              background: Image.network(
                widget.url,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
              //children不能是ListView了？Row可以
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

  // do not use ListView
  Widget _createListWidget() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        //Offset转变
        return FractionalTranslation(
          translation: _moveAnimation.value,
          child: child,
        );
      },
      child: Column(
        children: <Widget>[
          ...List<Widget>.generate(
              20,
              (index) => Container(
                    height: 50.0,
                    color: Colors.red.withAlpha(index * 255 ~/ 20),
                    alignment: Alignment.center,
                    child: Text('item $index'),
                  ))
        ],
      ),
    );
  }
}
