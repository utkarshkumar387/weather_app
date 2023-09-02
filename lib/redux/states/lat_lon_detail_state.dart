class LatLonDetailState {
  final double? lat;
  final double? lon;

  LatLonDetailState({
    required this.lat,
    required this.lon,
  });

  factory LatLonDetailState.init() {
    return LatLonDetailState(
      lat: 0.0,
      lon: 0.0,
    );
  }

  LatLonDetailState copyWith({
    double? lat,
    double? lon,
  }) {
    return LatLonDetailState(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}
