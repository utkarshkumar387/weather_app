class LatLonModel {
  String lat;
  String lon;
  LatLonModel({
    required this.lat,
    required this.lon,
  });

  factory LatLonModel.fromJson(Map<String, dynamic> json) {
    final lat = json['lat'];
    final lon = json['lon'];
    return LatLonModel(
      lat: lat,
      lon: lon,
    );
  }
}
