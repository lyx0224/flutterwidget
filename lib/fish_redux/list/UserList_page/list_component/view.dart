import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:myflutterwiget/fish_redux/list/UserList_page/list_component/action.dart';

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
        onTap: () => dispatch(
            UserListComponentActionCreator.getItemClickAction(state.user)),
        trailing: Text(state.user.location.city),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(state.user.picture.thumbnail),
        ),
        title: Text('${state.user.name.first} ${state.user.name.last}'),
      ),
    ),
  );
}
