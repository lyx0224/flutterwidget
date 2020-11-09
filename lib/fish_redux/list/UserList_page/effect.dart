import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/core/http_manager.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';
import 'action.dart';
import 'state.dart';

Effect<UserListState> buildEffect() {
  return combineEffects(<Object, Effect<UserListState>>{
    //页面初始化时候，加载数据
    Lifecycle.initState: _onRefresh
  });
}

void _onRefresh(Action action, Context<UserListState> ctx) async {
  HttpManager().init(baseUrl: 'https://randomuser.me');
  HttpManager().get(
      url: '/api/',
      tag: 'tag',
      successCallback: (val) {
        TestModel model = TestModel.fromJson(val);
        ctx.dispatch(UserListActionCreator.getShowListDataAction(model));
      },
      errorCallback: (e) {
        ctx.dispatch(UserListActionCreator.getShowErrMsgAction(e.message));
      });
}
