import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/dio/model/random_user.dart';
import 'package:myflutterwiget/dio/restful/base/error.dart';
import 'package:myflutterwiget/dio/restful/base/response.dart';
import 'package:myflutterwiget/dio/restful/rest_client.dart';

class DemoRestfulDio extends StatefulWidget {
  @override
  _DemoRestfulDioState createState() => _DemoRestfulDioState();
}

class _DemoRestfulDioState extends State<DemoRestfulDio> {
  BaseModel<RandomUser> _data;
  @override
  void initState() {
    super.initState();
    _fetchData().then((data) {
      setState(() {
        _data = data;
      });
    });
  }

  Future<BaseModel<RandomUser>> _fetchData() async {
    final _client = RestClient(Dio());
    RandomUser randomUser;
    try {
      randomUser = await _client.getRandomUser();
    } catch (e) {
      if (e is DioError) {
        return BaseModel()..setError(ServerError.withError(e));
      } else {
        return BaseModel()..setError(ServerError.withMsg(e.toString()));
      }
    }
    return BaseModel()..setData(randomUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('restful dio demo'),
        ),
        body: Center(
          child: Text(_data == null ? "loading" : getContent()),
        ));
  }

  String getContent() {
    if (_data.data == null) {
      return _data.error.toString();
    } else {
      return (_data.data as RandomUser).results[0].email;
    }
  }
}
