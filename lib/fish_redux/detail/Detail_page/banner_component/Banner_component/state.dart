import 'package:fish_redux/fish_redux.dart';

class BannerState implements Cloneable<BannerState> {
  List dataList = [];

  @override
  BannerState clone() {
    return BannerState()..dataList = dataList;
  }
}

BannerState initState(Map<String, dynamic> args) {
  return BannerState();
}
