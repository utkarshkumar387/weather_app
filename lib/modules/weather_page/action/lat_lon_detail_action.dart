import 'package:async_redux/async_redux.dart';
import 'package:weather_app/redux/states/app_state.dart';

class SetLatLonAction extends ReduxAction<AppState> {
  double? lat;
  double? lon;
  SetLatLonAction({required this.lat, required this.lon});
  @override
  Future<AppState?> reduce() async {
    return state.copyWith(
        latLonDetailState: state.latLonDetailState.copyWith(
      lat: lat,
      lon: lon,
    ));
  }
}
