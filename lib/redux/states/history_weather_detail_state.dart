import 'package:weather_app/modules/weather_page/models/history_weather_model.dart';

class HistoryWeatherDetailState {
  final HistoryWeatherModel? historyWeatherDetail;

  HistoryWeatherDetailState({
    required this.historyWeatherDetail,
  });

  factory HistoryWeatherDetailState.init() {
    return HistoryWeatherDetailState(
      historyWeatherDetail: null,
    );
  }

  HistoryWeatherDetailState copyWith({
    HistoryWeatherModel? historyWeatherDetail,
  }) {
    return HistoryWeatherDetailState(
      historyWeatherDetail: historyWeatherDetail ?? this.historyWeatherDetail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'historyWeatherDetail': historyWeatherDetail,
    };
  }
}
