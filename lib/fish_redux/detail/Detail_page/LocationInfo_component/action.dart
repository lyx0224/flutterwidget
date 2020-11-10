import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LocationInfoAction { action }

class LocationInfoActionCreator {
  static Action onAction() {
    return const Action(LocationInfoAction.action);
  }
}
