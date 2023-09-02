import 'package:flutter/material.dart';
import 'package:weather_app/utilities/generic_methods.dart';

class WeatherDetailCard extends StatelessWidget {
  final String? icon;
  final String? temp;
  final String? weather;
  final String? date;
  const WeatherDetailCard(
      {Key? key,
      required this.icon,
      required this.temp,
      required this.weather,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.81),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network('http://openweathermap.org/img/w/$icon.png'),
                    RichText(
                      text: TextSpan(
                        text: temp,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 44, 44, 44),
                          fontSize: 24,
                          fontFamily: 'Circular Std',
                          fontWeight: FontWeight.w500,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: ' deg',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 44, 44),
                              fontSize: 12,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  weather ?? '',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 44, 44, 44),
                    fontSize: 12,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
                GenericMethods.getDate(
                  int.parse(
                    date ?? '',
                  ),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 44, 44, 44),
                  fontSize: 16,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}
