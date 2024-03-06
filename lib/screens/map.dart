// import 'package:flutter/material.dart';
//محمد
// import 'package:flutter_map/plugin_api.dart';
// import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:gymjibi/constants.dart';
// import 'package:gymjibi/navigation.dart';
// import 'package:gymjibi/screens/home/home_screen.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:http/http.dart' as http;
//
// class ShowCollectionMap extends StatefulWidget {
//
//   const ShowCollectionMap({super.key});
//
//   @override
//   State<ShowCollectionMap> createState() => _ShowCollectionMapState();
// }
//
// class _ShowCollectionMapState extends State<ShowCollectionMap> {
//   final PopupController _popupController = PopupController();
//
//   late List markers;
//
//   var client = http.Client();
//
//   final MapController _mapController = MapController();
//
//   var collectionsLatitude = 31.839145508940945;
//
//   var collectionsLongitude = 54.36190067490672;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // برگرداندن به صفحه خانه
//         Get.offAll(Homescreen.new,transition: Transition.noTransition);
//         return true;
//       },
//       child: Scaffold(
//         extendBody: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             Text("نقشه",style: bodyXL,),
//             Text("نمایش مجموعه های داخل جیم جیبی روی نقشه",style: bodyXS,)
//           ],)
//         ),
//         body: Stack(
//           alignment: Alignment.bottomRight,
//           children: [
//             FlutterMap(
//               options: MapOptions(
//                 center: LatLng(collectionsLatitude, collectionsLongitude),
//                 zoom: 11,
//
//                 plugins: [MarkerClusterPlugin()],
//                 onTap: (tapPosition, point) =>
//                     _popupController.hideAllPopups(),
//               ),
//               mapController: _mapController,
//               layers: [
//                 TileLayerOptions(
//                   urlTemplate:
//                   'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//                 MarkerClusterLayerOptions(
//                   maxClusterRadius: 0,
//                   disableClusteringAtZoom: 0,
//                   size: const Size(40, 10),
//                   anchor: AnchorPos.align(AnchorAlign.center),
//                   fitBoundsOptions:
//                   const FitBoundsOptions(padding: EdgeInsets.all(50)),
//                   markers: [
//                     Marker(
//                       anchorPos: AnchorPos.align(AnchorAlign.center),
//                       height: 30,
//                       width: 30,
//                       point: LatLng(collectionsLatitude, collectionsLongitude),
//                       builder: (ctx) => const Icon(Icons.pin_drop),
//                     ),
//                     Marker(
//                       anchorPos: AnchorPos.align(AnchorAlign.bottom),
//                       height: 30,
//                       width: 30,
//                       point: LatLng(31.844547508963955, 54.37290067490682),
//                       builder: (ctx) => const Icon(Icons.pin_drop),
//                     ),
//                   ],
//                   builder: (context, markers) {
//                     return FloatingActionButton(
//                       onPressed: null,
//                       child: Text(markers.length.toString()),
//                     );
//                   },
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 78,horizontal: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       _mapController.move(_mapController.center,
//                           _mapController.zoom + 0.25);
//                     },
//                     child: Container(
//                         padding: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: white,
//                           borderRadius:
//                           BorderRadius.circular(4),
//                         ),
//                         child: Icon(
//                           Icons.add,
//                           color: cMain,
//                         )),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       _mapController.move(_mapController.center,
//                           _mapController.zoom - 0.25);
//                     },
//                     child: Container(
//                         padding: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: white,
//                           borderRadius:
//                           BorderRadius.circular(4),
//                         ),
//                         child: Icon(
//                           Icons.remove,
//                           color: cMain,
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavBar(index: 1),
//       ),
//     );
//   }
// }
