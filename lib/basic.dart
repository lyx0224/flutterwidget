import 'package:flutter/material.dart';

class BasicWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchInput(
              onClick: (s) {
                print('do search action:$s');
              },
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ColumnItem(
                    color: Colors.blue,
                  ),
                  ColumnItem(
                    color: Colors.green,
                  ),
                  ColumnItem(
                    color: Colors.red,
                  ),
                  ColumnItem(
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              disabledColor: Colors.grey, //when onPressed is null
              onPressed: () {},
              child: Text(
                'more',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            Text(
              'theme color',
              style: TextStyle(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

//自定义suffix，方便调整间距、增加点击事件
class SearchInput extends StatelessWidget {
  const SearchInput({
    Key key,
    this.onClick,
    this.hit,
    this.controller,
  }) : super(key: key);

  final Function(String) onClick;
  final String hit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var searchContent = "";
    return Container(
      alignment: Alignment.center,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50.0,
                color: Colors.green[100])
          ]),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (s) {
                searchContent = s;
              },
              decoration: InputDecoration(
                  //suffixIcon: Icon(Icons.search),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hit ?? "please input",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onTap: () {
              onClick(searchContent);
            },
          )
        ],
      ),
    );
  }
}

class ColumnItem extends StatelessWidget {
  final Color color;

  const ColumnItem({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 200,
      height: 100,
      color: color.withAlpha(50),
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text('SingleChildScrollView item'),
      ),
    );
  }
}
