import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

class DetailState implements Cloneable<DetailState> {
  Results results;
  @override
  DetailState clone() {
    return DetailState()..results = results;
  }
}

DetailState initState(Map<String, dynamic> args) {
  Results result = args['data'];
  DetailState state = DetailState();
  state.results = result;
  return state;
}
