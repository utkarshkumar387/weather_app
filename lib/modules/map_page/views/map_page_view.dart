import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/modules/map_page/action/forecast_tile_action.dart';
import 'package:weather_app/modules/map_page/models/map_layer.dart';
import 'package:weather_app/modules/map_page/views/widgets/custom_radio_tile.dart';

class MapPageView extends StatefulWidget {
  late double lat;
  late double lon;
  MapPageView({
    super.key,
    this.lat = 0.0,
    this.lon = 0.0,
  });

  @override
  State<MapPageView> createState() => MapPageViewState();
}

class MapPageViewState extends State<MapPageView> {
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  MapLayer mapLayer = MapLayer.precipitation_new;

  late final CameraPosition _position = CameraPosition(
    target: LatLng(widget.lat, widget.lon),
    zoom: 4,
  );

  Set<TileOverlay> _tileOverlays = {};

//Initializing tile from openWeatherAPI on google map as an overlay
  _initTiles(String mapLayer) async {
    final String tileOverlayId =
        DateTime.now().millisecondsSinceEpoch.toString();
    final tileOverlay = TileOverlay(
        tileOverlayId: TileOverlayId(tileOverlayId),
        tileProvider: ForecastTileAction(mapType: mapLayer));

    setState(() {
      _tileOverlays = {tileOverlay};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _position,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                controller = controller;
              });
              _initTiles(mapLayer.name);
            },
            tileOverlays: _tileOverlays,
          ),
          Positioned(
            child: Container(
              height: 90,
              width: 180,
              margin: const EdgeInsets.only(top: 60, left: 20),
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 241, 241, 241),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x1E7C3FCC),
                    blurRadius: 8,
                    offset: Offset(4, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomRadioTile(
                      isActive:
                          mapLayer == MapLayer.precipitation_new ? true : false,
                      title: 'Precipitation View',
                      onChanged: (() {
                        setState(
                          () {
                            mapLayer = MapLayer.precipitation_new;
                            _initTiles(mapLayer.name);
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomRadioTile(
                      isActive: mapLayer == MapLayer.temp_new ? true : false,
                      title: 'Temperature view',
                      onChanged: (() {
                        setState(
                          () {
                            mapLayer = MapLayer.temp_new;
                            _initTiles(mapLayer.name);
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
