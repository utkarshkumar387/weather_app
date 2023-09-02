import 'package:async_redux/async_redux.dart';
import 'package:weather_app/redux/dev_tools/dev_tools_store.dart';
import 'package:weather_app/redux/states/app_state.dart';

class DevToolsStateObserver extends StateObserver<AppState> {
  @override
  void observe(
    ReduxAction<AppState> action,
    AppState stateIni,
    AppState stateEnd,
    Object? error,
    int dispatchCount,
  ) {
    devToolsStore.dispatch(action);
  }
}
