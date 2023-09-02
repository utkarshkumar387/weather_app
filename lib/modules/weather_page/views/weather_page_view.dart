import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather_page/action/weather_detail_action.dart';
import 'package:weather_app/modules/weather_page/connector/history_weather_view_connector.dart';
import 'package:weather_app/modules/weather_page/models/history_weather_model.dart';
import 'package:weather_app/modules/weather_page/models/weather_model.dart';
import 'package:weather_app/modules/weather_page/views/widgets/summary_card.dart';
import 'package:weather_app/modules/weather_page/views/widgets/weather_detail_card.dart';
import 'package:weather_app/redux/store.dart';
import 'package:weather_app/utilities/generic_methods.dart';

class WeatherPageView extends StatefulWidget {
  final WeatherModel? weatherDetail;
  final HistoryWeatherModel? historyWeatherData;
  final String place;
  const WeatherPageView(
      {Key? key,
      required this.weatherDetail,
      required this.historyWeatherData,
      required this.place})
      : super(key: key);

  @override
  State<WeatherPageView> createState() => _WeatherPageViewState();
}

class _WeatherPageViewState extends State<WeatherPageView> {
  final TextEditingController dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String convertedDateTime =
            "${picked.day.toString()}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString().padLeft(2, '0')}";
        store.dispatch(GetWeatherDetailsByTimeAction(date: picked));
        dateController.value = TextEditingValue(text: convertedDateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 209, 205, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GenericMethods.getDate(int.parse(
                              widget.weatherDetail?.current.dt ?? '')),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 44, 44),
                            fontSize: 18,
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                widget.place,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 44, 44, 44),
                                  fontSize: 14,
                                  fontFamily: 'Circular Std',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            'http://openweathermap.org/img/w/${widget.weatherDetail?.current.weatherDetail[0].icon}.png'),
                        RichText(
                          text: TextSpan(
                            text: widget.weatherDetail?.current.temp ?? '',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 44, 44),
                              fontSize: 54,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: ' deg',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 44, 44),
                                  fontSize: 24,
                                  fontFamily: 'Circular Std',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.weatherDetail?.current.weatherDetail[0].main ?? '',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 16,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SummaryCard(weatherDetail: widget.weatherDetail?.current),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Weather for next 7 days',
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.20,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.weatherDetail?.daily.length,
                    itemBuilder: (context, index) {
                      return (index == 0)
                          ? const SizedBox.shrink()
                          : WeatherDetailCard(
                              icon: widget.weatherDetail?.daily[index]
                                  .weatherDetail[0].icon,
                              temp: widget.weatherDetail?.daily[index].temp,
                              weather: widget.weatherDetail?.daily[index]
                                  .weatherDetail[0].main,
                              date: widget.weatherDetail?.daily[index].dt,
                            );
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Historical data',
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.20,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 194, 180, 255),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: TextField(
                      controller: dateController,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 194, 180, 255),
                        contentPadding: EdgeInsets.only(top: 16),
                        border: InputBorder.none,
                        hintText: '06/12/1997',
                        prefixIcon: // add padding to adjust icon
                            Icon(
                          Icons.calendar_month,
                          size: 32,
                        ),
                        isDense: true,
                      ),
                      onTap: (() => _selectDate(context)),
                    ),
                  ),
                  const HistoryWeatherViewConnector()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
