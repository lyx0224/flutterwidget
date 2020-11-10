import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/fish_redux/global_store/global_state.dart';
import 'package:myflutterwiget/fish_redux/global_store/reducer.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}
