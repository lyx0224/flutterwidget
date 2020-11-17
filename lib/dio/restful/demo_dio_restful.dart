import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/dio/model/random_user.dart';
import 'package:myflutterwiget/dio/restful/rest_client.dart';

class DemoRestfulDio extends StatefulWidget {
  @override
  _DemoRestfulDioState createState() => _DemoRestfulDioState();
}

class _DemoRestfulDioState extends State<DemoRestfulDio> {
  RandomUser _randomUser;
  String _errMsg = "";

  @override
  void initState() {
    super.initState();
    final _client = RestClient(Dio());
    _client.getRandomUser().then((data) {
      setState(() {
        _randomUser = data;
        _errMsg = null;
      });
    }).catchError((Object e) {
      switch (e.runtimeType) {
        case DioError:
          final msg = (e as DioError).response.statusMessage;
          setState(() {
            _randomUser = null;
            _errMsg = msg;
          });
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('restful dio demo'),
        ),
        body: Center(
          child: Text(_errMsg ?? _randomUser.results[0].email),
        ));
  }
}
