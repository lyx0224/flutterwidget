import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/fish_redux/list/UserList_page/list_adapter/UserList_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserListPage extends Page<UserListState, Map<String, dynamic>> {
  UserListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<UserListState>(
              //指定列表的adapter和连接器
              adapter: NoneConn<UserListState>() + UserListAdapter(),
              slots: <String, Dependent<UserListState>>{}),
          middleware: <Middleware<UserListState>>[],
        );
}
