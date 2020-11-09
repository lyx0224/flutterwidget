import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';
import 'package:myflutterwiget/fish_redux/list/UserList_page/list_component/component.dart';
import 'package:myflutterwiget/fish_redux/list/UserList_page/list_component/state.dart';
import 'package:myflutterwiget/fish_redux/list/UserList_page/state.dart';

import 'reducer.dart';

class UserListAdapter extends DynamicFlowAdapter<UserListState> {
  UserListAdapter()
      : super(
          //注册item component，支持多种item布局?
          pool: <String, Component<Object>>{'item': UserListComponent()},
          connector: _UserListConnector(),
          reducer: buildReducer(),
        );
}

//从列表页UserListState 连接到 ItemBean
class _UserListConnector extends ConnOp<UserListState, List<ItemBean>> {
  @override
  List<ItemBean> get(UserListState state) {
    if (state.testModel.results.isNotEmpty) {
      return state.testModel.results.map<ItemBean>((m) {
        UserItemState itemState = UserItemState();
        itemState.user = m;
        return ItemBean('item', itemState);
      }).toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(UserListState parentState, List<ItemBean> items) {
    if (items.isNotEmpty) {
      parentState.testModel.results = List<Results>.from(items.map((m) {
        return m.data;
      })).toList();
    } else {
      parentState.testModel.results = [];
    }
  }

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
