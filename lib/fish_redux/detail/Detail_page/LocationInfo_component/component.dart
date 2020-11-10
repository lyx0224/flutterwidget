import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LocationInfoComponent extends Component<LocationInfoState> {
  LocationInfoComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<LocationInfoState>(
              adapter: null, slots: <String, Dependent<LocationInfoState>>{}),
        );
}
