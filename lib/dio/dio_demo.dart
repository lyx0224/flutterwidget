import 'package:flutter/material.dart';
import 'package:myflutterwiget/dio/simple_http_manager.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

class DioDemo extends StatelessWidget {
  static const url = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dio example'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<TestModel>(
          builder: (BuildContext context, AsyncSnapshot<TestModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return Text(snapshot.data.info.seed);
                } else if (snapshot.hasError) {
                  return Text('error');
                } else {
                  return Container();
                }
                break;
              default:
                return Container();
            }
          },
          future: _loadData(),
        ),
      ),
    );
  }

  Future<TestModel> _loadData() async {
    final responese =
        await SimpleHttpManager().get(path: 'https://randomuser.me/api/');
    return TestModel.fromJson(responese.data);
  }
}
