import 'package:flutter/material.dart';
import 'package:weather_app/modules/map_page/connector/map_page_view_connector.dart';
import 'package:weather_app/modules/weather_page/connector/weatherpage_view_connector.dart';
import 'package:weather_app/routes/route_names.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      RouteNames.mapPageView: (BuildContext context) =>
          const MapPageViewConnector(),
      RouteNames.weatherPageView: (BuildContext context) =>
          const WeatherpageViewConnector(),
    };
  }
}
