import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/dio/model/test_model.dart';
import 'package:myflutterwiget/fish_redux/detail/Detail_page/LocationInfo_component/state.dart';
import 'package:myflutterwiget/fish_redux/detail/Detail_page/banner_component/Banner_component/state.dart';

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

class LocationInfoComponentConnector
    extends ConnOp<DetailState, LocationInfoState> {
  @override
  LocationInfoState get(DetailState state) {
    return LocationInfoState()..location = state.results.location;
  }
}

class BannerComponentConnector extends ConnOp<DetailState, BannerState> {
  @override
  BannerState get(DetailState state) {
    BannerState bannerState = BannerState();
    bannerState.dataList = [
      {'image': state.results.picture.medium},
      {'image': state.results.picture.medium}
    ];
    return bannerState;
  }
}
