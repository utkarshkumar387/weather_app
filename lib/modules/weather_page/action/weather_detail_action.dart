import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/environment_config.dart';
import 'package:weather_app/modules/weather_page/models/history_weather_model.dart';
import 'package:weather_app/modules/weather_page/models/loading_model.dart';
import 'package:weather_app/modules/weather_page/models/weather_model.dart';
import 'package:weather_app/redux/states/app_state.dart';

class GetWeatherDetailsAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    var client = http.Client();
    try {
      final lat = state.latLonDetailState.lat;
      final lon = state.latLonDetailState.lon;
      final response = await client.get(
        Uri.parse(
          "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&units=metric&appid=${EnvironmentConfig.API_KEY}",
          // "",
        ),
        headers: {'content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final responseModel = WeatherModel.fromJson(json.decode(response.body));
        return state.copyWith(
          weatherDetailState: state.weatherDetailState.copyWith(
            weatherDetail: responseModel,
          ),
        );
      } else {
        Fluttertoast.showToast(msg: 'Server error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  void before() => dispatch(ChangeLoadingStatusAction(LoadingStatus.loading));

  @override
  void after() => dispatch(ChangeLoadingStatusAction(LoadingStatus.success));
}

class GetWeatherDetailsByTimeAction extends ReduxAction<AppState> {
  final DateTime date;
  GetWeatherDetailsByTimeAction({required this.date});
  @override
  Future<AppState?> reduce() async {
    var client = http.Client();
    try {
      final lat = state.latLonDetailState.lat;
      final lon = state.latLonDetailState.lon;
      final epochDate = date.millisecondsSinceEpoch ~/ 1000;
      final response = await client.get(
        Uri.parse(
          "https://api.openweathermap.org/data/3.0/onecall/timemachine?lat=$lat&lon=$lon&dt=$epochDate&units=metric&appid=${EnvironmentConfig.API_KEY}",
        ),
        headers: {'content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final responseModel = HistoryWeatherModel.fromJson(
          json.decode(response.body),
        );
        return state.copyWith(
          historyWeatherData: state.historyWeatherData.copyWith(
            historyWeatherDetail: responseModel,
          ),
        );
      } else {
        Fluttertoast.showToast(msg: 'Server error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

class SetPlaceAction extends ReduxAction<AppState> {
  String? place;
  SetPlaceAction({required this.place});
  @override
  Future<AppState?> reduce() async {
    return state.copyWith(
      weatherDetailState: state.weatherDetailState.copyWith(
        place: place,
      ),
    );
  }
}

class ChangeLoadingStatusAction extends ReduxAction<AppState> {
  final LoadingStatus loadingStatus;

  ChangeLoadingStatusAction(this.loadingStatus);

  @override
  AppState reduce() {
    return state.copyWith(
      loadingStatus: loadingStatus,
    );
  }
}
