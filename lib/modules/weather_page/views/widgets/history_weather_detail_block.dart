import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather_page/models/history_weather_model.dart';
import 'package:weather_app/modules/weather_page/views/widgets/summary_card.dart';
import 'package:weather_app/modules/weather_page/views/widgets/weather_detail_card.dart';

class HistoryWeatherDetailBlock extends StatelessWidget {
  final HistoryWeatherModel? historyWeatherData;
  const HistoryWeatherDetailBlock({Key? key, required this.historyWeatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherDetailCard(
            icon: historyWeatherData
                ?.historyWeatherDetail[0].weatherDetail[0].icon,
            weather: historyWeatherData
                ?.historyWeatherDetail[0].weatherDetail[0].main,
            date: historyWeatherData?.historyWeatherDetail[0].dt,
            temp: historyWeatherData?.historyWeatherDetail[0].temp),
        SummaryCard(weatherDetail: historyWeatherData?.historyWeatherDetail[0]),
      ],
    );
  }
}
