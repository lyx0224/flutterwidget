import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget buildView(
    DetailState state, Dispatch dispatch, ViewService viewService) {
  ///取值在initState中
  ///below error
  // Map<String, dynamic> map =
  //     ModalRoute.of(viewService.context).settings.arguments;
  // Results results = map['data'];
  return Scaffold(
    appBar: AppBar(
      title: Text('${state.results.name.first} ${state.results.name.last}'),
    ),
    body: Center(
      child: Text('detail'),
    ),
  );
}
