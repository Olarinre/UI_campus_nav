import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'package:ui_campus_nav/screens/search.dart';

class MapScreen extends StatefulWidget {
  String mydestination;
  MapScreen({super.key, required this.mydestination});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  TextEditingController destinationController = TextEditingController();
  TextEditingController? mydestination;
  StreamSubscription<Position>? positionStream;
  LatLng? currentLocation;
  LatLng? destinationLocation;
  String estimatedTime = "";
  Set<Polyline> polylines = {};
  Set<Marker> markers = {}; // Markers set
  String apiKey = 'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ'; // Your Google Maps API Key
     final PlacesService _placesService =
      PlacesService('AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ');
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    destinationController = TextEditingController(text: widget.mydestination);
    log(destinationController.text);
  }

  void _getCurrentLocation() {
    var locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position position) {
        setState(() {
          currentLocation = LatLng(position.latitude, position.longitude);
          // Update the marker for the current location
          _updateMarkers();
        });
        if (destinationController.text.isNotEmpty) {
          _fetchDirections();
        }
      },
    );
  }

  Future<void> _fetchDirections() async {
    if (currentLocation == null || destinationController.text.isEmpty) return;
    destinationLocation =
        await _getCoordinatesFromAddress(destinationController.text);
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${currentLocation!.latitude},${currentLocation!.longitude}&destination=${destinationLocation!.latitude},${destinationLocation!.longitude}&key=$apiKey';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      _updateRoute(data);
      _updateEstimatedTime(data);
      _updateMarkers(); // Update markers whenever directions are fetched
    }
  }

  Future<LatLng> _getCoordinatesFromAddress(String address) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey'));
    var json = jsonDecode(response.body);
    var location = json['results'][0]['geometry']['location'];
    return LatLng(location['lat'], location['lng']);
  }

  void _updateRoute(Map<String, dynamic> data) {
    List<LatLng> points = [];
    var steps = data['routes'][0]['legs'][0]['steps'];
    for (var step in steps) {
      var polyline = step['polyline']['points'];
      var decodedPolyline = _decodePolyline(polyline);
      points.addAll(decodedPolyline);
    }
    setState(() {
      polylines.clear();
      polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          color: Colors.blue,
          width: 5,
          points: points,
        ),
      );
    });
  }

  void _updateMarkers() {
    setState(() {
      markers.clear();
      if (currentLocation != null) {
        markers.add(Marker(
          markerId: MarkerId("currentLocation"),
          position: currentLocation!,
          infoWindow: InfoWindow(title: "Current Location"),
        ));
      }
      if (destinationLocation != null) {
        markers.add(Marker(
          markerId: MarkerId("destination"),
          position: destinationLocation!,
          infoWindow: InfoWindow(title: "Destination"),
        ));
      }
    });
  }

  void _updateEstimatedTime(Map<String, dynamic> data) {
    var duration = data['routes'][0]['legs'][0]['duration'];
    setState(() {
      estimatedTime = duration['text'];
    });
  }

  List<LatLng> _decodePolyline(String encoded) {
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
      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map with Real-Time Directions and ETA'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) => mapController = controller,
              initialCameraPosition: CameraPosition(
                target: currentLocation ?? LatLng(7.4697, 3.8961),
                //  target:
                //     LatLng(37.7749, -122.4194), // Coordinates of San Francisco
                zoom: 14,
              ),
              polylines: polylines,
              markers: markers,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // onTap: () async {
              //     // show input autocomplete with selected mode
              //   // then get the Prediction selected
              //   Prediction? p = await PlacesAutocomplete.show(
              //     context: context,
              //     apiKey: apiKey,
              //     mode: Mode.overlay, // Mode.fullscreen
              //     language: "en",
                  
              //   );
              //   displayPrediction(p!);
              // },
               onChanged: (value) async {
                log("message");
                final suggestions =
                    await _placesService.fetchSuggestions(value);
                setState(() {
                  _suggestions = suggestions;
                  // log(_suggestions as String);
                });
              },
              controller: destinationController,
              decoration: InputDecoration(
                hintText: 'Enter Destination',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _fetchDirections,
                ),
              ),
            ),
          ),
           Column(
            children: List.generate(
                _suggestions.length,
                (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        destinationController.text = _suggestions[index];
                      });
                    },
                    child: Text(_suggestions[index]))),
          ),
          if (estimatedTime.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Estimated Travel Time: $estimatedTime'),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }







  Future<void> displayPrediction(Prediction p) async {
    if (p != null) {
      GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: apiKey);
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId.toString());
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      setState(() {
        destinationController.text = p.description!;
      });

      print("Details: Lat=$lat, Lng=$lng");
      log("Details: Lat=$lat, Lng=$lng");
    }
  }

  
}
