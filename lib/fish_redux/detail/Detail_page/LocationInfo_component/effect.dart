import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<LocationInfoState> buildEffect() {
  return combineEffects(<Object, Effect<LocationInfoState>>{
    LocationInfoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<LocationInfoState> ctx) {
}
