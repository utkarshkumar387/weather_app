import 'package:weather_app/modules/weather_page/models/weather_model.dart';

class WeatherDetailState {
  final WeatherModel? weatherDetail;
  final String? place;

  WeatherDetailState({
    required this.weatherDetail,
    required this.place,
  });

  factory WeatherDetailState.init() {
    return WeatherDetailState(
      weatherDetail: null,
      place: '',
    );
  }

  WeatherDetailState copyWith({
    WeatherModel? weatherDetail,
    String? place,
  }) {
    return WeatherDetailState(
      weatherDetail: weatherDetail ?? this.weatherDetail,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weatherDetails': weatherDetail,
      'place': place,
    };
  }
}
