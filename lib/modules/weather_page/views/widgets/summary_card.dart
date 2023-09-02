import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather_page/models/weather_model.dart';
import 'package:weather_app/modules/weather_page/views/widgets/summary_detail_card.dart';

class SummaryCard extends StatelessWidget {
  final Current? weatherDetail;
  const SummaryCard({Key? key, required this.weatherDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.81),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SummaryDetailCard(
                      icon: Icons.wind_power,
                      value: weatherDetail?.windSpeed ?? '',
                      valueTitle: 'Wind Speed'),
                  SummaryDetailCard(
                      icon: Icons.water_drop,
                      value: weatherDetail?.humidity ?? '',
                      valueTitle: 'Humidity'),
                  SummaryDetailCard(
                      icon: Icons.cloud,
                      value: weatherDetail?.clouds ?? '',
                      valueTitle: 'Clouds')
                ],
              )
            ],
          )),
    );
  }
}
