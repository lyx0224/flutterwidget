import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    LocationInfoState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      children: <Widget>[
        Text(state.location.city),
        Text(state.location.state),
        Text(state.location.country),
        Text(state.location.postcode.toString())
      ],
    ),
  );
}
