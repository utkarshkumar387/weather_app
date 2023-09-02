import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/modules/map_page/views/map_page_view.dart';
import 'package:weather_app/redux/states/app_state.dart';

class MapPageViewConnector extends StatelessWidget {
  const MapPageViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      builder: (context, snapshot) {
        return MapPageView(
          lat: snapshot.lat ?? 0.0,
          lon: snapshot.lon ?? 0.0,
        );
      },
    );
  }
}

class _ViewModel extends Vm {
  final double? lat;
  final double? lon;
  _ViewModel({
    required this.lat,
    required this.lon,
  }) : super(equals: [lat, lon]);
}

class _ViewModelFactory extends VmFactory<AppState, MapPageViewConnector> {
  _ViewModelFactory(MapPageViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        lat: state.latLonDetailState.lat,
        lon: state.latLonDetailState.lon,
      );
}
