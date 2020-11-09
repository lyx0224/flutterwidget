import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    UserItemState state, Dispatch dispatch, ViewService viewService) {
  return Card(
    color: Colors.white,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: ListTile(
        trailing: Text(state.user.location.city),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(state.user.picture.thumbnail),
        ),
        title: Text('${state.user.name.first} ${state.user.name.last}'),
      ),
    ),
  );
}
