import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<UserItemState> buildEffect() {
  return combineEffects(<Object, Effect<UserItemState>>{
    UserListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UserItemState> ctx) {}
