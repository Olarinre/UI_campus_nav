// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';

// class MapScreen extends StatefulWidget {
//   String mydestination;
//   MapScreen({super.key, required this.mydestination});
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//  late Position currentPosition;
//  late LatLng currentLocation;
//   TextEditingController destinationController = TextEditingController();
//   Set<Polyline> _polylines = {};

//   bool delay = false;

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   void initState() {
    
//     super.initState();
   
//     _getCurrentLocation();
//     print(widget.mydestination);
//     print("hello word");
//     _goToDestination();
//   }

//   final List<LatLng> universityBounds = [
//     LatLng(-7.360000, 38.980000), // Southwest corner
//     LatLng(-7.360000, 38.985000), // Southwest to southeast
//     LatLng(-7.355000, 38.985000), // Southeast to northeast
//     LatLng(-7.355000, 38.980000), // Northeast to northwest
//     LatLng(-7.360000, 38.980000), // Close the polygon
//   ];

//   late GoogleMapController _controller;
// // LatLngBounds _bounds = LatLngBounds(
// //     southwest:
// //         LatLng(7.4680, 3.8944), // Southwest bounds of University of Ibadan
// //     northeast:
// //         LatLng(7.4716, 3.8968), // Northeast bounds of University of Ibadan
// //   );
//   // void _checkBoundaries(LatLng target) {
//   //   if (!_bounds.contains(target)) {
//   //     _controller.animateCamera(
//   //       CameraUpdate.newLatLngBounds(_bounds, 0), // animate back to bounds
//   //     );
//   //   }
//   // }
//   Set<Marker> markers = {};
//   TextEditingController? mydestination;

//   // void _drawPolyline() {
//   //   if (currentPosition != null && widget.mydestination != null) {
//   //     setState(() {
//   //       markers.clear();
//   //       _addMarker(currentPosition.latitude as LatLng, 'Current Location');
//   //       _addMarker(destinationLocation, 'Destination');
//   //     });
//   //   }
//   // }

//   void _addMarker(LatLng position, String markerId, BitmapDescriptor icon) {
//     MarkerId id = MarkerId(markerId);
//     Marker marker = Marker(
//       markerId: id,
//       icon: icon,
//       position: position,
//       infoWindow: InfoWindow(title: markerId),
//     );
//     setState(() {
//       markers.add(marker);
//     });
//   }

//   // Future<void> _getCurrentLocation() async {
//   //   bool serviceEnabled;
//   //   LocationPermission permission;

//   //   // Check if location services are enabled
//   //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled) {
//   //     // Location services are not enabled, show a dialog to enable location services
//   //     _showLocationServiceAlertDialog();
//   //     return;
//   //   }

//   //   // Check permission status
//   //   permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied) {
//   //     // Permission has been denied, request permission from the user
//   //     permission = await Geolocator.requestPermission();
//   //     if (permission == LocationPermission.denied) {
//   //       // Permission has been denied again, show a dialog or message to inform the user
//   //       _showPermissionDeniedDialog();
//   //       return;
//   //     }
//   //   }

//   //   // Permission has been granted, get current location
//   //   Position position = await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.high);
//   //   setState(() {
//   //     currentPosition = position;
//   //     print("MY current loaction" "${currentPosition}");
//   //   });
//   //   _goToDestination();
//   // }

// Future<void> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     setState(() {
//       currentLocation = LatLng(position.latitude, position.longitude);
//     });
//     _addMarker(
//         currentLocation, 'Current Location', BitmapDescriptor.defaultMarker);
//   }
//   void _showLocationServiceAlertDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Location Services Disabled'),
//           content: Text('Please enable location services to use this app.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showPermissionDeniedDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Location Permission Denied'),
//           content: Text('Please grant location permission to use this app.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _goToDestination() async {
//    // _getCurrentLocation();
//     print(widget.mydestination);
//     String destination = " university of ibadan ${widget.mydestination}";
//     print(destination);
//     List<Location> locations = await locationFromAddress(
//         destination); // Use locationFromAddress from the geocoding package
//          print(locations);
//     if (locations != null ) {
//       print("object");
//       Location destinationLocation = locations.first;
//       LatLng destinationLatLng = LatLng(
//         destinationLocation.latitude,
//         destinationLocation.longitude,
//       );

//       mapController.animateCamera(
//         CameraUpdate.newLatLng(destinationLatLng),
//       );
//       //print("done");
//       setState(() {
        
//         _polylines.clear();
//         _polylines.add(
//           Polyline(
//             polylineId: PolylineId('userDestination'),
//             color: Colors.blue,
//             width: 5,
//             points: [
//               LatLng(currentPosition.latitude, currentPosition.longitude),
//               destinationLatLng,
//             ],
//           ),
//         );
        
//       });
//       //  markers.clear();
//       // _addMarker(currentPosition.latitude as LatLng, 'Current Location',
//       //     BitmapDescriptor.defaultMarker);
//       // _addMarker(destinationLocation.latitude as LatLng, 'Destination',
//       //     BitmapDescriptor.defaultMarker);
//       // print("done");
//     } else {
//       return showsres();
//     }
//   }

//   void showsres() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Location Not within Range'),
//           content: Text('Please Move to the school area.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.mydestination),
//       ),
//       body: FutureBuilder(
//           future: _getCurrentLocation(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               return Column(
//                 children: [
//                   Expanded(
//                     child: GoogleMap(
//                       onMapCreated: _onMapCreated,
//                       mapType: MapType.normal,
//                       //             markers: {
//                       //   Marker(
//                       //     markerId: MarkerId('currentLocation'),
//                       //     position: LatLng(currentPosition.latitude, currentPosition.longitude),
//                       //     infoWindow: InfoWindow(title: 'Current Location'),
//                       //     icon: BitmapDescriptor.defaultMarker,
//                       //   ),
//                       //   Marker(
//                       //     markerId: MarkerId('destination'),
//                       //     position: LatLng(currentPosition.latitude, currentPosition.longitude),
//                       //     infoWindow: InfoWindow(title: 'Destination'),
//                       //     icon: BitmapDescriptor.defaultMarker,
//                       //   ),
//                       // },
//                       // initialCameraPosition: CameraPosition(
//                       //   target: LatLng(
//                       //       currentPosition.latitude, currentPosition.longitude),
//                       //   zoom: 11.0,
//                       // ),
//                       initialCameraPosition: const CameraPosition(
//                         target: LatLng(
//                           7.4697, 3.8961), // Centered on University of Ibadan
//                         zoom: 14,
//                        // bearing:
//                       ),
//                        markers: markers,
//                       // initialCameraPosition: const CameraPosition(
//                       //   target: LatLng(
//                       //       7.3775, 3.9470), // Centered on University of Ibadan
//                       //   zoom: 15,
//                       //   // bearing:
//                       // ),
//                       polylines: _polylines,
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: TextField(
//                   //     controller: mydestination,
//                   //     decoration: InputDecoration(
//                   //       labelText: 'Destination',
//                   //       suffixIcon: IconButton(
//                   //         icon: Icon(Icons.search),
//                   //         onPressed: _goToDestination,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               );
//             }
//             // return Column(
//             //   children: [
//             //     Text("OUt of bound"),
//             //     Expanded(
//             //       child: GoogleMap(
//             //         mapType: MapType.hybrid,
//             //         onMapCreated: _onMapCreated,

//             //         initialCameraPosition: CameraPosition(
//             //           target: LatLng(
//             //              7.4697,
//             //                     3.8961), // Centered on University of Ibadan
//             //           zoom: 15,
//             //         ),
//             //         polylines: _polylines,
//             //       ),
//             //     ),
//             //     // Padding(
//             //     //   padding: const EdgeInsets.all(8.0),
//             //     //   child: TextField(
//             //     //     controller: destinationController,
//             //     //     decoration: InputDecoration(
//             //     //       labelText: 'Destination',
//             //     //       suffixIcon: IconButton(
//             //     //         icon: Icon(Icons.search),
//             //     //         onPressed: _goToDestination,
//             //     //       ),
//             //     //     ),
//             //     //   ),
//             //     // ),
//             //   ],
//             // );
//           }),
//     );
//   }
// }
