class WeatherModel {
  String lat;
  String lon;
  Current current;
  List<Daily> daily;
  WeatherModel({
    required this.lat,
    required this.lon,
    required this.current,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final lat = json['lat'].toString();
    final lon = json['lon'].toString();
    final current = Current.fromJson(json['current']);
    final daily = <Daily>[];
    if (json['daily'] != null) {
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }
    return WeatherModel(
      lat: lat,
      lon: lon,
      current: current,
      daily: daily,
    );
  }
}

class Daily {
  String temp;
  String humidity;
  String dt;
  String windSpeed;
  String clouds;
  List<Weather> weatherDetail;
  Daily({
    required this.temp,
    required this.dt,
    required this.humidity,
    required this.windSpeed,
    required this.weatherDetail,
    required this.clouds,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    final temp = json['temp']['max'].toString();
    final humidity = json['humidity'].toString();
    final dt = json['dt'].toString();
    final windSpeed = json['wind_speed'].toString();
    final clouds = json['clouds'].toString();
    final weatherDetail = <Weather>[];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weatherDetail.add(Weather.fromJson(v));
      });
    }

    return Daily(
      dt: dt,
      temp: temp,
      humidity: humidity,
      windSpeed: windSpeed,
      weatherDetail: weatherDetail,
      clouds: clouds,
    );
  }
}

class Current {
  String temp;
  String humidity;
  String dt;
  String windSpeed;
  String clouds;
  List<Weather> weatherDetail;
  Current({
    required this.temp,
    required this.dt,
    required this.humidity,
    required this.windSpeed,
    required this.weatherDetail,
    required this.clouds,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'].toString();
    final humidity = json['humidity'].toString();
    final dt = json['dt'].toString();
    final windSpeed = json['wind_speed'].toString();
    final clouds = json['clouds'].toString();
    final weatherDetail = <Weather>[];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weatherDetail.add(Weather.fromJson(v));
      });
    }

    return Current(
      dt: dt,
      temp: temp,
      humidity: humidity,
      windSpeed: windSpeed,
      weatherDetail: weatherDetail,
      clouds: clouds,
    );
  }
}

class Weather {
  String main;
  String icon;
  Weather({
    required this.main,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final main = json['main'];
    final icon = json['icon'];

    return Weather(
      main: main,
      icon: icon,
    );
  }
}
