import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';

class LocationInfoState implements Cloneable<LocationInfoState> {
  Location location;
  @override
  LocationInfoState clone() {
    return LocationInfoState();
  }
}

LocationInfoState initState(Map<String, dynamic> args) {
  return LocationInfoState()..location = Location();
}
