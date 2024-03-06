/*
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:gymjibi/constants.dart';


class MapCollection extends StatefulWidget {
  late final Future<LatLng> Function() onGetCurrentLocationPressed;

  @override
  State<MapCollection> createState() => _MapState();
}

class _MapState extends State<MapCollection> {
  final PopupController _popupController = PopupController();

  late List markers;


  var client = http.Client();


  MapController _mapController = MapController();

  var collections_latitude = 31.839145508940945;
  var collections_longitude = 54.36190067490672;

  @override

  Widget build(BuildContext context) {
    //final LocationService locationService = LocationService();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(child: Text("نمایش مجموعه‌ها  روی نقشه",style: h4,)),

        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            height: 120,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(collections_latitude, collections_longitude),
                zoom: 11,

                plugins: [MarkerClusterPlugin()],
                onTap: (tapPosition, point) =>
                    _popupController.hideAllPopups(),
              ),
              mapController: _mapController,
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerClusterLayerOptions(
                  maxClusterRadius: 0,
                  disableClusteringAtZoom: 0,
                  size: Size(40, 10),
                  anchor: AnchorPos.align(AnchorAlign.center),
                  fitBoundsOptions:
                     FitBoundsOptions(padding: EdgeInsets.all(50)),
                  markers: [
                    Marker(
                      anchorPos: AnchorPos.align(AnchorAlign.center),
                      height: 30,
                      width: 30,
                      point: LatLng(collections_latitude, collections_longitude),
                      builder: (ctx) => Icon(Icons.pin_drop),
                    ),
                    Marker(
                      anchorPos: AnchorPos.align(AnchorAlign.bottom),
                      height: 30,
                      width: 30,
                      point: LatLng(31.844547508963955, 54.37290067490682),
                      builder: (ctx) => Icon(Icons.pin_drop),
                    ),
                  ],
                  builder: (context, markers) {
                    return FloatingActionButton(
                      onPressed: null,
                      child: Text(markers.length.toString()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/
