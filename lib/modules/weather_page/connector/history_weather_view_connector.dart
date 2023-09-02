import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather_page/models/history_weather_model.dart';
import 'package:weather_app/modules/weather_page/views/widgets/history_weather_detail_block.dart';
import 'package:weather_app/redux/states/app_state.dart';

class HistoryWeatherViewConnector extends StatelessWidget {
  const HistoryWeatherViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      builder: (context, snapshot) {
        return (snapshot.historyWeatherData?.historyWeatherDetail == null)
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 20.0),
                child: Center(
                  child: Text(
                    'Please select date to check historical Data',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              )
            : HistoryWeatherDetailBlock(
                historyWeatherData: snapshot.historyWeatherData,
              );
      },
    );
  }
}

class _ViewModel extends Vm {
  final HistoryWeatherModel? historyWeatherData;
  _ViewModel({
    required this.historyWeatherData,
  }) : super(equals: [historyWeatherData]);
}

class _ViewModelFactory
    extends VmFactory<AppState, HistoryWeatherViewConnector> {
  _ViewModelFactory(HistoryWeatherViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        historyWeatherData: state.historyWeatherData.historyWeatherDetail,
      );
}
