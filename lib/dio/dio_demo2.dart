import 'package:flutter/material.dart';
import 'package:myflutterwiget/dio/core/http_manager.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

import 'core/http_error.dart';

class DioDemo2 extends StatefulWidget {
  @override
  _DioDemo2State createState() => _DioDemo2State();
}

class _DioDemo2State extends State<DioDemo2> {
  TestModel model;
  HttpError httpError;
  @override
  void initState() {
    HttpManager().init(baseUrl: 'https://randomuser.me');
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dio2 demo'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFF12711), Color(0xFFf5af19)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: _buildView(),
      ),
    );
  }

  Widget _buildUserWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(model.results[0].picture.large),
            radius: 70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
                '${model.results[0].name.first} ${model.results[0].name.last}',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('${model.results[0].email}',
                style: Theme.of(context).textTheme.title),
          )
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'loading...',
              style: TextStyle(color: Colors.white),
            ),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            httpError.message,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            onPressed: () {
              _fetchData();
            },
            color: Theme.of(context).primaryColor,
            child: Text(
              'retry',
              style: Theme.of(context).textTheme.title,
            ),
          )
        ],
      ),
    );
  }

  void _fetchData() {
    httpError = null;
    HttpManager().get(
        url: '/api/',
        tag: 'tag',
        successCallback: (val) {
          setState(() {
            model = TestModel.fromJson(val);
          });
        },
        errorCallback: (e) {
          setState(() {
            httpError = e;
          });
          print(e.toString());
        });
  }

  Widget _buildView() {
    Widget child;
    if (model == null) {
      if (httpError == null) {
        child = _buildLoadingWidget();
      } else {
        child = _buildErrorWidget();
      }
    } else {
      child = _buildUserWidget();
    }
    return child;
  }
}
