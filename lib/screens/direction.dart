import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;



class MapScreens extends StatefulWidget {
  String mydestination;
   MapScreens({super.key, required this.mydestination});

  @override
  State<MapScreens> createState() => _MapScreensState();
}

class _MapScreensState extends State<MapScreens> {
  late GoogleMapController mapController;
  late LatLng currentLocation;
  LatLng? destinationLocation;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
   String durationText = '';

  TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
     _goToDestination();
    _getCurrentLocation();
    _getDirections();
    log("estinationController.text");
    
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
    _addMarker(
        currentLocation, 'Current Location', BitmapDescriptor.defaultMarker);
  }

// Future<void> _goToDestination() async {
//   print(destinationController.text);
//     String destination = destinationController.text;
//     List<geo.Location> placemarks = await geo.locationFromAddress(destination);
//     if (placemarks != null && placemarks.isNotEmpty) {
//       geo.Location destinationPlacemark = placemarks.first;
//       LatLng destinationLocation = LatLng(
//         destinationPlacemark.latitude,
//         destinationPlacemark.longitude,
//       );
//       setState(() {
//         this.destinationLocation = destinationLocation;
//       });
//       _addMarker(destinationLocation, 'Destination',
//           BitmapDescriptor.defaultMarker);
//       _getDirections();
//     }
//   }

  Future<void> _goToDestination() async {
    print(destinationController.text);
    log(widget.mydestination);
    try {
      print(destinationController.text);
      //String destination = "  university of ibadan ${widget.mydestination} ";
      String destination = " university of ibadan ${widget.mydestination}     ";
      List<Location> locations = await locationFromAddress(destination);
      if (locations != null && locations.isNotEmpty) {
        Location destinationLocationData = locations.first;
        LatLng destinationLocation = LatLng(
          destinationLocationData.latitude,
          destinationLocationData.longitude,
        );
        setState(() {
          this.destinationLocation = destinationLocation;
        });
        _addMarker(
            destinationLocation, 'Destination', BitmapDescriptor.defaultMarker);
        log('message');
        _getDirections();
        log('waiting here');
      } else {
        print('No location found for address: $destination');
      }
    } catch (e) {
      print('Error in _goToDestination: $e');
    }
  }



  void _extractDuration(Map<String, dynamic> data) {
    var duration = data['routes'][0]['legs'][0]['duration'];
    String text = duration['text'];
    setState(() {
      durationText = text;
      log(durationText);
    });
  }
  //  Future<void> _getDirections() async {
  //   log("first click");
  //   String apiKey =
  //       'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ'; // Replace with your own API key
  //   log("second click");
  //   String url =
  //       'https://maps.googleapis.com/maps/api/directions/json?origin=${currentLocation.latitude},${currentLocation.longitude}&destination=${destinationLocation!.latitude},${destinationLocation!.longitude}&key=$apiKey';
  //   log("teste me here");
  //   var response = await http.get(Uri.parse(url));
  //   log(response.statusCode.toString());
  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body);
  //     _parseDirections(data);
  //      _extractDuration(data);
  //   }
  // }
 Future<void> _getDirections() async {
    log("first click");
    String apiKey =
        'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ'; // Replace with your own API key
    log("second click");
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${currentLocation.latitude},${currentLocation.longitude}&destination=${destinationLocation!.latitude},${destinationLocation!.longitude}&key=$apiKey';
    log("teste me here");
    var response = await http.get(Uri.parse(url));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _parseDirections(data);
       _extractDuration(data);
    }
  }

  void _parseDirections(Map<String, dynamic> data) {
    List<LatLng> polylineCoordinates = [];
    data['routes'][0]['legs'][0]['steps'].forEach((step) {
      String polyline = step['polyline']['points'];
      List<LatLng> decodedPolyline = decodePolyline(polyline);
      polylineCoordinates.addAll(decodedPolyline);
    });

    setState(() {
      polylines.clear();
      polylines.add(
        Polyline(
          polylineId: PolylineId('Route'),
          color: Colors.blue,
          width: 5,
          points: polylineCoordinates,
        ),
      );
    });
  }

  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;
    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      double latitude = lat / 1E5;
      double longitude = lng / 1E5;
      points.add(LatLng(latitude, longitude));
    }
    return points;
  }

  void _addMarker(LatLng position, String markerId, BitmapDescriptor icon) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
      markerId: id,
      position: position,
      icon: icon,
      infoWindow: InfoWindow(title: markerId),
    );
    setState(() {
      markers.add(marker);
    });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(widget.mydestination),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            initialCameraPosition: CameraPosition(
              target: currentLocation ?? LatLng(0, 0),
              zoom: 15,
            ),
            markers: markers,
            polylines: polylines,
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  
                   
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16.0),
                      child: Text('Estimated Duration: $durationText'),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}










// late GoogleMapController mapController;
// late LatLng currentLocation;
// LatLng? destinationLocation;
// Set<Marker> markers = {};
// Set<Polyline> polylines = {};

// TextEditingController destinationController = TextEditingController();

// @override
// void initState() {
//   super.initState();
//   _getCurrentLocation();
//   log("estinationController.text");
//   // _goToDestination();
// }

// Future<void> _getCurrentLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
//   setState(() {
//     currentLocation = LatLng(position.latitude, position.longitude);
//   });
//   _addMarker(
//       currentLocation, 'Current Location', BitmapDescriptor.defaultMarker);
// }

// // Future<void> _goToDestination() async {
// //   print(destinationController.text);
// //     String destination = destinationController.text;
// //     List<geo.Location> placemarks = await geo.locationFromAddress(destination);
// //     if (placemarks != null && placemarks.isNotEmpty) {
// //       geo.Location destinationPlacemark = placemarks.first;
// //       LatLng destinationLocation = LatLng(
// //         destinationPlacemark.latitude,
// //         destinationPlacemark.longitude,
// //       );
// //       setState(() {
// //         this.destinationLocation = destinationLocation;
// //       });
// //       _addMarker(destinationLocation, 'Destination',
// //           BitmapDescriptor.defaultMarker);
// //       _getDirections();
// //     }
// //   }

// Future<void> _goToDestination() async {
//   print(destinationController.text);
//   log(destinationController.text);
//   try {
//     print(destinationController.text);
//     String destination = "university of ibadan ";
//     List<Location> locations = await locationFromAddress(destination);
//     if (locations != null && locations.isNotEmpty) {
//       Location destinationLocationData = locations.first;
//       LatLng destinationLocation = LatLng(
//         destinationLocationData.latitude,
//         destinationLocationData.longitude,
//       );
//       setState(() {
//         this.destinationLocation = destinationLocation;
//       });
//       _addMarker(
//           destinationLocation, 'Destination', BitmapDescriptor.defaultMarker);
//       log('message');
//       _getDirections();
//       log('waiting here');
//     } else {
//       print('No location found for address: $destination');
//     }
//   } catch (e) {
//     print('Error in _goToDestination: $e');
//   }
// }

// Future<void> _getDirections() async {
//   log("first click");
//   String apiKey =
//       'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ'; // Replace with your own API key
//   log("second click");
//   String url =
//       'https://maps.googleapis.com/maps/api/directions/json?origin=${currentLocation.latitude},${currentLocation.longitude}&destination=${destinationLocation!.latitude},${destinationLocation!.longitude}&key=$apiKey';
//   log("teste me here");
//   var response = await http.get(Uri.parse(url));
//   log(response.statusCode.toString());
//   if (response.statusCode == 200) {
//     var data = json.decode(response.body);
//     _parseDirections(data);
//   }
// }

// void _parseDirections(Map<String, dynamic> data) {
//   List<LatLng> polylineCoordinates = [];
//   data['routes'][0]['legs'][0]['steps'].forEach((step) {
//     String polyline = step['polyline']['points'];
//     List<LatLng> decodedPolyline = decodePolyline(polyline);
//     polylineCoordinates.addAll(decodedPolyline);
//   });

//   setState(() {
//     polylines.clear();
//     polylines.add(
//       Polyline(
//         polylineId: PolylineId('Route'),
//         color: Colors.blue,
//         width: 5,
//         points: polylineCoordinates,
//       ),
//     );
//   });
// }

// List<LatLng> decodePolyline(String encoded) {
//   List<LatLng> points = [];
//   int index = 0, len = encoded.length;
//   int lat = 0, lng = 0;
//   while (index < len) {
//     int b, shift = 0, result = 0;
//     do {
//       b = encoded.codeUnitAt(index++) - 63;
//       result |= (b & 0x1f) << shift;
//       shift += 5;
//     } while (b >= 0x20);
//     int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//     lat += dlat;
//     shift = 0;
//     result = 0;
//     do {
//       b = encoded.codeUnitAt(index++) - 63;
//       result |= (b & 0x1f) << shift;
//       shift += 5;
//     } while (b >= 0x20);
//     int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//     lng += dlng;

//     double latitude = lat / 1E5;
//     double longitude = lng / 1E5;
//     points.add(LatLng(latitude, longitude));
//   }
//   return points;
// }

// void _addMarker(LatLng position, String markerId, BitmapDescriptor icon) {
//   MarkerId id = MarkerId(markerId);
//   Marker marker = Marker(
//     markerId: id,
//     position: position,
//     icon: icon,
//     infoWindow: InfoWindow(title: markerId),
//   );
//   setState(() {
//     markers.add(marker);
//   });
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Google Maps Demo'),
//     ),
//     body: Stack(
//       children: [
//         GoogleMap(
//           onMapCreated: (controller) {
//             setState(() {
//               mapController = controller;
//             });
//           },
//           initialCameraPosition: CameraPosition(
//             target: currentLocation ?? LatLng(0, 0),
//             zoom: 15,
//           ),
//           markers: markers,
//           polylines: polylines,
//         ),
//         Positioned(
//           top: 10,
//           left: 10,
//           right: 10,
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: destinationController,
//                     decoration: InputDecoration(
//                       labelText: 'Destination',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     log('checking');
//                     _goToDestination;
//                   },
//                   child: Text('Go'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
