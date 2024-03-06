// import 'dart:async';
//محمد
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:http/http.dart' as http;
// import 'package:gymjibi/constants.dart';
//
// import 'package:geolocator/geolocator.dart';
// import 'dart:convert';
//
// class OpenStreetMap extends StatefulWidget {
//
//   final collectionsLatitude;
//   final collectionsLongitude;
//   final String address;
//   final String nameGym;
//
//   const OpenStreetMap({required this.collectionsLatitude,required this.collectionsLongitude,required this.address,required this.nameGym});
//
//   // late final Future<LatLng> Function() onGetCurrentLocationPressed;
//
//   @override
//   State<OpenStreetMap> createState() => _OpenStreetMapState();
// }
//
// class _OpenStreetMapState extends State<OpenStreetMap>
// {
//
//
//   final PopupController _popupController = PopupController();
//
//   // late List markers;
//
//   // var client = http.Client();
//
//   final MapController _mapController = MapController();
//
//
//   List<LatLng> routpoints = [];
//   bool isVisible = false;
//
//   var _mylocationlatitude;
//   var _mylocationlongitude;
//
//   bool isLoading = false;
//
//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission()
//         .then(
//       (value) {},
//     )
//         .onError(
//       (error, stackTrace) {
//         print("error");
//       },
//     );
//     return await Geolocator.getCurrentPosition();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //final LocationService locationService = LocationService();
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20, left: 20,),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "موقعیت مکانی",
//                 style: h4,
//               ),
//               Container(
//                 height: 250,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       height: 250,
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           color: white,
//                           borderRadius: BorderRadius.all(Radius.circular(16))),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(16)),
//                         child: FlutterMap(
//                           options: MapOptions(
//                             center: LatLng(
//                                 widget.collectionsLatitude, widget.collectionsLongitude),
//                             minZoom: 4,
//                             plugins: [MarkerClusterPlugin()],
//                             onTap: (tapPosition, point) =>
//                                 _popupController.hideAllPopups(),
//                           ),
//                           mapController: _mapController,
//                           layers: [
//                             TileLayerOptions(
//                               urlTemplate:
//                                   'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                               subdomains: ['a', 'b', 'c'],
//                             ),
//                             MarkerClusterLayerOptions(
//                               maxClusterRadius: 120,
//                               disableClusteringAtZoom: 6,
//                               size: Size(40, 10),
//                               // anchor: AnchorPos.align(AnchorAlign.center),
//                               // fitBoundsOptions:
//                               //     FitBoundsOptions(padding: EdgeInsets.all(50)),
//                               markers: [
//                                 Marker(
//
//                                   height: 30,
//                                   width: 30,
//                                   point: LatLng(widget.collectionsLatitude,widget.collectionsLongitude),
//                                   child: Icon(Icons.pin_drop),
//                                 ),
//                                 if (_mylocationlatitude != null)
//                                   Marker(
//
//                                     height: 30,
//                                     width: 30,
//                                     point: LatLng(_mylocationlatitude,
//                                         _mylocationlongitude),
//                                     child:  Icon(
//                                       Icons.my_location,
//                                       size: 18,
//                                       color: cMain,
//                                     ),
//                                   ),
//                               ],
//                               polygonOptions: PolygonOptions(
//                                 isDotted: true,
//                                 borderColor: Colors.blue,
//                                 color: Colors.red,
//                                 borderStrokeWidth: 30,
//                               ),
//                               popupOptions: PopupOptions(
//                                 popupSnap: PopupSnap.markerTop,
//                                 popupController: _popupController,
//                                 popupBuilder: (_, marker) => Container(
//                                   width: 100,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                       color: white,
//                                       borderRadius: BorderRadius.circular(4)),
//                                   child: Center(child: Text(widget.nameGym,style: bodyMDb,)),
//                                 ),
//                               ),
//                               builder: (context, markers) {
//                                 return FloatingActionButton(
//                                   onPressed: null,
//                                   child: Text(markers.length.toString()),
//                                 );
//                               },
//                             ),
//                             // PolylineLayerOptions(
//                             //   polylineCulling: true,
//                             //   saveLayers: true,
//                             //   polylines: [
//                             //     Polyline(
//                             //       points: routpoints,
//                             //       color: cMain,
//                             //       strokeWidth: 4,
//                             //     )
//                             //   ],
//                             // ),
//                           ], children: [],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 250,
//                       padding: const EdgeInsets.all(25),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {},
//                                     child: Container(
//                                         padding: EdgeInsets.all(8),
//                                         decoration: BoxDecoration(
//                                           color: white,
//                                           borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(4),
//                                               topRight: Radius.circular(16),
//                                               bottomLeft: Radius.circular(4),
//                                               bottomRight: Radius.circular(4)),
//                                         ),
//                                         child: Text(
//                                           'نمایش بزرگتر',
//                                           style: bodyXSb,
//                                         )),
//                                   ),
//                                   SizedBox(
//                                     height: 4,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       _mapController.move(_mapController.center,
//                                           _mapController.zoom + 0.25);
//                                     },
//                                     child: Container(
//                                         padding: EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                           color: white,
//                                           borderRadius:
//                                               BorderRadius.circular(4),
//                                         ),
//                                         child: Icon(
//                                           Icons.add,
//                                           color: cMain,
//                                         )),
//                                   ),
//                                   SizedBox(
//                                     height: 4,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       _mapController.move(_mapController.center,
//                                           _mapController.zoom - 0.25);
//                                     },
//                                     child: Container(
//                                         padding: EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                           color: white,
//                                           borderRadius:
//                                               BorderRadius.circular(4),
//                                         ),
//                                         child: Icon(
//                                           Icons.remove,
//                                           color: cMain,
//                                         )),
//                                   ),
//                                   SizedBox(
//                                     height: 4,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       _mapController.move(
//                                           LatLng(widget.collectionsLatitude,widget.collectionsLongitude),
//                                           _mapController.zoom);
//                                       //sign+12
//                                     },
//                                     child: Container(
//                                         padding: EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                           color: white,
//                                           borderRadius:
//                                               BorderRadius.circular(4),
//                                         ),
//                                         child: Icon(
//                                           Icons.location_on,
//                                           color: cMain,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                               GestureDetector(
//                                 onTap: () async {
//                                   setState(() {
//                                     isLoading = true;
//                                     print(isLoading);
//                                   });
//
//                                   getUserCurrentLocation().then((value) async {
//                                     print('my location');
//                                     print(value.latitude.toString() +
//                                         " " +
//                                         value.longitude.toString());
//                                     setState(() {
//                                       _mylocationlatitude = value.latitude;
//                                       _mylocationlongitude = value.longitude;
//                                       _mapController.move(
//                                           LatLng(_mylocationlatitude,
//                                               _mylocationlongitude),
//                                           _mapController.zoom);
//                                       isLoading = false;
//                                       print(isLoading);
//
//                                     });
//                                     var urlrouting = Uri.parse(
//                                         'http://router.project-osrm.org/route/v1/driving/$_mylocationlongitude,$_mylocationlatitude;${widget.collectionsLongitude},${widget.collectionsLatitude}?steps=true&annotations=true&geometries=geojson&overview=full');
//                                     var response = await http.get(urlrouting);
//                                     print(response.body);
//                                     setState(() {
//                                       routpoints = [];
//                                       var ruter =
//                                           jsonDecode(response.body)['routes'][0]
//                                               ['geometry']['coordinates'];
//                                       for (int i = 0; i < ruter.length; i++) {
//                                         var reep = ruter[i].toString();
//                                         reep = reep.replaceAll("[", "");
//                                         reep = reep.replaceAll("]", "");
//                                         var lat1 = reep.split(',');
//                                         var long1 = reep.split(",");
//                                         routpoints.add(LatLng(
//                                             double.parse(lat1[1]),
//                                             double.parse(long1[0])));
//                                       }
//                                       isVisible = !isVisible;
//                                       print(routpoints);
//                                     });
//                                   });
//                                 },
//                                 child: Container(
//                                     padding: EdgeInsets.all(8),
//                                     decoration: BoxDecoration(
//                                       color: white,
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(16),
//                                           topRight: Radius.circular(4),
//                                           bottomLeft: Radius.circular(4),
//                                           bottomRight: Radius.circular(4)),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         if(isLoading == true)
//                                           SizedBox(height: 12,width: 12 ,child: CircularProgressIndicator(strokeWidth: 2,)),
//                                         SizedBox(width: 5,),
//                                         Text(
//                                           'مسیریابی',
//                                           style: bodyXSb,
//                                         ),
//                                       ],
//                                     )),
//                               ),
//                             ],
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: white,
//                                 borderRadius: BorderRadius.only(
//                                     bottomRight: Radius.circular(16),
//                                     bottomLeft: Radius.circular(16),
//                                     topLeft: Radius.circular(4),
//                                     topRight: Radius.circular(4))),
//                             width: MediaQuery.of(context).size.width,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 8, horizontal: 8),
//                             child: Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   "assets/icons/location.svg",
//                                   color: black,
//                                 ),
//                                 SizedBox(
//                                   width: 3,
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1,
//                                     widget.address,
//                                     style: bodyMDb,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
