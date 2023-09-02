import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:weather_app/redux/states/app_state.dart';
import 'package:weather_app/redux/store.dart';

final remoteDevtools = RemoteDevToolsMiddleware(
  '192.168.43.203:8000',
);

final devToolsStore = DevToolsStore<AppState>(
  (AppState _, dynamic action) => store.state,
  initialState: AppState.init(),
  middleware: [remoteDevtools],
);
