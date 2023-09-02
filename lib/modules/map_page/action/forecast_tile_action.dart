import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/environment_config.dart';

class ForecastTileAction implements TileProvider {
  final String mapType;
  ForecastTileAction({required this.mapType});

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    Uint8List tileBytes = Uint8List(0);
    try {
      final url =
          "https://tile.openweathermap.org/map/$mapType/$zoom/$x/$y.png?appid=${EnvironmentConfig.API_KEY}";

      final uri = Uri.parse(url);

      final ByteData imageData = await NetworkAssetBundle(uri).load("");
      tileBytes = imageData.buffer.asUint8List();
    } catch (e) {
      debugPrint(e.toString());
    }
    return Tile(256, 256, tileBytes);
  }
}
