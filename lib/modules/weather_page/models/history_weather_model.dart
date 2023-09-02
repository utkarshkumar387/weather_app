import 'package:weather_app/modules/weather_page/models/weather_model.dart';

class HistoryWeatherModel {
  String lat;
  String lon;
  List<Current> historyWeatherDetail;
  HistoryWeatherModel({
    required this.lat,
    required this.lon,
    required this.historyWeatherDetail,
  });

  factory HistoryWeatherModel.fromJson(Map<String, dynamic> json) {
    final lat = json['lat'].toString();
    final lon = json['lon'].toString();
    final historyWeatherDetail = <Current>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        historyWeatherDetail.add(Current.fromJson(v));
      });
    }

    return HistoryWeatherModel(
      lat: lat,
      lon: lon,
      historyWeatherDetail: historyWeatherDetail,
    );
  }
}
