import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather_page/models/loading_model.dart';
import 'package:weather_app/redux/states/history_weather_detail_state.dart';
import 'package:weather_app/redux/states/lat_lon_detail_state.dart';
import 'package:weather_app/redux/states/weather_detail_state.dart';

@immutable
class AppState {
  final WeatherDetailState weatherDetailState;
  final LatLonDetailState latLonDetailState;
  final LoadingStatus loadingStatus;
  final HistoryWeatherDetailState historyWeatherData;
  const AppState({
    required this.weatherDetailState,
    required this.latLonDetailState,
    required this.loadingStatus,
    required this.historyWeatherData,
  });

  factory AppState.init() {
    return AppState(
      weatherDetailState: WeatherDetailState.init(),
      latLonDetailState: LatLonDetailState.init(),
      loadingStatus: LoadingStatus.idle,
      historyWeatherData: HistoryWeatherDetailState.init(),
    );
  }

  AppState copyWith({
    WeatherDetailState? weatherDetailState,
    LatLonDetailState? latLonDetailState,
    LoadingStatus? loadingStatus,
    HistoryWeatherDetailState? historyWeatherData,
  }) {
    return AppState(
      weatherDetailState: weatherDetailState ?? this.weatherDetailState,
      latLonDetailState: latLonDetailState ?? this.latLonDetailState,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      historyWeatherData: historyWeatherData ?? this.historyWeatherData,
    );
  }

  @override
  bool operator ==(covariant AppState other) {
    if (identical(this, other)) return true;

    return other.weatherDetailState == weatherDetailState &&
        other.latLonDetailState == latLonDetailState &&
        other.loadingStatus == loadingStatus &&
        other.historyWeatherData == historyWeatherData;
  }

  @override
  int get hashCode {
    return weatherDetailState.hashCode ^
        latLonDetailState.hashCode ^
        loadingStatus.hashCode ^
        historyWeatherData.hashCode;
  }
}
