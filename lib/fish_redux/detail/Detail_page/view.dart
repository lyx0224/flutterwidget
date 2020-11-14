import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';
import 'state.dart';

Widget buildView(
    DetailState state, Dispatch dispatch, ViewService viewService) {
  ///取值在initState中
  ///below error
  // Map<String, dynamic> map =
  //     ModalRoute.of(viewService.context).settings.arguments;
  // Results results = map['data'];
  Results results = state.results;
  return Scaffold(
    body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text('${results.name.first} ${results.name.last}'),
                background: Image.network(
                  results.picture.large,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  viewService.buildComponent('location_component_slot'),
                  viewService.buildComponent('banner_component_slot')
                ],
              ),
            )
          ];
        },
        body: Container()),
  );
}
