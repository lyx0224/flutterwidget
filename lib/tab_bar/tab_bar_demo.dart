import 'package:flutter/material.dart';

const content = '这种方式的tab+content是系统封装好的，比较简单。但是不方便添加其他功能，比如tab小红点';

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var controller = TabController(length: 4, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text('tab bar'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          MockTabContent(
            content: '$content',
          ),
          MockTabContent(
            content: 'content1',
          ),
          MockTabContent(
            content: 'content2',
          ),
          MockTabContent(
            content: 'content3',
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          onTap: (index) {
            print('index $index clicked.');
          },
          tabs: [
            Tab(
              text: 'Home',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'wechat',
              icon: Icon(Icons.chat),
            ),
            Tab(
              text: 'discover',
              icon: Icon(Icons.find_in_page),
            ),
            Tab(
              text: 'profile',
              icon: Icon(Icons.android),
            )
          ],
          controller: controller,
        ),
      ),
    );
  }
}

class MockTabContent extends StatelessWidget {
  const MockTabContent({
    Key key,
    this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('$content'),
    );
  }
}
