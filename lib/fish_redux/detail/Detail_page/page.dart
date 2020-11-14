import 'package:fish_redux/fish_redux.dart';
import 'package:myflutterwiget/fish_redux/detail/Detail_page/LocationInfo_component/component.dart';
import 'package:myflutterwiget/fish_redux/detail/Detail_page/banner_component/Banner_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DetailPage extends Page<DetailState, Map<String, dynamic>> {
  DetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DetailState>(
              adapter: null,
              slots: <String, Dependent<DetailState>>{
                'location_component_slot':
                    LocationInfoComponentConnector() + LocationInfoComponent(),
                'banner_component_slot':
                    BannerComponentConnector() + BannerComponent()
              }),
          middleware: <Middleware<DetailState>>[],
        );
}
