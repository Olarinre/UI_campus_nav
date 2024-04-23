import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/places.dart';
import 'package:ui_campus_nav/screens/search.dart';



class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  final search = TextEditingController();
  late GoogleMapController mapController;
  late Position currentPosition;
  final LatLng _center = const LatLng(7.391165102, 3.916663);
   String nearByAPIKey = '';
   GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: 'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ');
       final PlacesService _placesService = PlacesService('AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ');
  List<String> _suggestions = [];
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
   
  // }


   @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show a dialog to enable location services
      _showLocationServiceAlertDialog();
      return;
    }

    // Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Permission has been denied, request permission from the user
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission has been denied again, show a dialog or message to inform the user
        _showPermissionDeniedDialog();
        return;
      }
    }

    // Permission has been granted, get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
    });
  }

   void _showLocationServiceAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Services Disabled'),
          content: Text('Please enable location services to use this app.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


   void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Permission Denied'),
          content: Text('Please grant location permission to use this app.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  late GoogleMapController _controller;
   LatLngBounds _bounds = LatLngBounds(
    southwest:
        LatLng(7.4680, 3.8944), // Southwest bounds of University of Ibadan
    northeast:
        LatLng(7.4716, 3.8968), // Northeast bounds of University of Ibadan
  );
  void _checkBoundaries(LatLng target) {
    if (!_bounds.contains(target)) {
      _controller.animateCamera(
        CameraUpdate.newLatLngBounds(_bounds, 0), // animate back to bounds
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}),
       appBar: AppBar(
        title: const Text('Maps Sample App'),
        elevation: 2,
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
         // alignment: Alignment.topCenter,
          children: [
            Expanded(
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        7.4735, 3.7629), // Centered on University of Ibadan
                    zoom: 11,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  onCameraMove: (CameraPosition position) {
                    _checkBoundaries(position.target);
                  },
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
              
                  // onMapCreated: _onMapCreated,
                  // initialCameraPosition: CameraPosition(
              
                  //   target: _center,
                  //   zoom: 11.0,
                  // ),
                  //  onCameraMove: (CameraPosition position) {
                  //   _checkBoundaries(position.target);
                  // },
                  // myLocationButtonEnabled: true,
                  // myLocationEnabled: true,
                  // mapType: MapType.normal,
                ),
            ),
            TextFormField(
                // obscureText: cpasskey,
                controller: search,
                onChanged: (value) async {
                   log("message");
                  final suggestions = await _placesService.fetchSuggestions(value);
                setState(() {
                  _suggestions = suggestions;
                  log(_suggestions as String);
                });
                   //_fetchDirections(search.text);
                  //  log("message");
                  //  getNearByPlace(
                  //     userLocation: currentPosition,
                  //     //type: 'school',
                  //     radius: 500,
                  //     keyWord: search.text);
                  // _performAutoComplete(search.text);
                },
                decoration: InputDecoration(
                    hintText: 'Search here',
                    //label:
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 240, 238, 238),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                        color: Colors.white10,
                      ),
                    ),
                    fillColor: const Color.fromARGB(255, 240, 238, 238),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // cpasskey ? Icons.visibility :
                        Icons.mic,
                        color: const Color.fromARGB(255, 2, 21, 124),
                      ),
                      onPressed: () {
                      //  _fetchDirections(search.text);
                        //placeAutoComplete(placeInput: search.text);
                        //_showAutoCompleteSearch(context);
                       // getNearByPlace(userLocation: currentPosition, radius: 500, keyWord: search.text);
                        // setState(
                        //   () {
                        //     //cpasskey = !cpasskey;
                        //   },
                        // );
                      },
                    ),
                    prefixIcon: Icon(Icons.search)),
              ),
             Expanded(
               child: ListView.builder(
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_suggestions[index]),
                    );
                  },
                ),
             ),
          ],
        ),
      )
    );
  }





 void _searchPlace(String query) async {
    // Perform autocomplete search while typing
    if (query.isNotEmpty) {
      PlacesAutocompleteResponse response = await _places.autocomplete(
        query,
        language:
            'en', // Optional. Can specify the language of the autocomplete results.
        components: [
          Component(Component.country, 'NG')
        ], // Optional. Limit results to Nigeria.
      );

      if (response.isOkay) {
        // Do something with the predictions (e.g., display them in a list)
        print(response.predictions);
      } else {
        // Handle error
        print("hello M ajdsb sdkjsdskd""${response.errorMessage}");
      }
    }
  }

  void _performAutoComplete(String value) async {
    // Show autocomplete suggestions while typing
    if (value.isNotEmpty) {
      PlacesAutocompleteResponse response = await _places.autocomplete(
        value,
        language:
            'en', // Optional. Can specify the language of the autocomplete results.
        components: [
          Component(Component.country, 'NG')
        ], // Optional. Limit results to Nigeria.
      );

      if (response.isOkay) {
        // Do something with the predictions (e.g., display them in a list)
        print(response.predictions);
      } else {
        // Handle error
        print(response.errorMessage);
      }
    }
  }







  Future<List<Map<String, dynamic>>> getNearByPlace({
  required Position userLocation,
  String? keyWord,
  //required String type,
  required double radius,
}) async {

  try {
    // Null check for API key and other required values
      ;
     nearByAPIKey = "AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ";
    if (nearByAPIKey == null ||
        userLocation == null ||
        userLocation.latitude == null ||
        userLocation.longitude == null 
        //type == null
        ) {
      throw ArgumentError(
          'Invalid parameters: API key or required location information is missing.');
    }

    // Check if keyWord is null or empty, and provide a default value
    final keywordParam = keyWord?.isNotEmpty == true ? '&keyword=$keyWord' : '';

//     final url = Uri.https(
//   'maps.googleapis.com',
//   '/maps/api/place/nearbysearch/json?',
//   {
//     'input': keyWord,
//     'location': '${userLocation.latitude},${userLocation.longitude}',
//     'radius': '$radius',
//     //'type': type,
//     'key': nearByAPIKey!,
//     ...Uri.splitQueryString(keywordParam),
//   },
// );
      String url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$keyWord&location=7.4410%2C3.9067&radius=50000&key=AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ';
log("am here");

    final response = await http.get(Uri.parse(url));
log(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      log(response.body);
      final responseBody = jsonDecode(response.body);
      if (responseBody is Map<String, dynamic> &&
          responseBody.containsKey('results')) {
        List<dynamic> results = responseBody['results'];
        List<Map<String, dynamic>> places = results.cast<Map<String, dynamic>>();
        print(responseBody);
          
          List<String> descriptions =
              places.map((p) => p['description'] as String).toList();
          log(descriptions as String);
        print('LAT:${userLocation.latitude}');
        print('LONG:${userLocation.longitude}');
        print('Radius:${radius}');
        print('PLACES: $places');
        //log(places as String);
        // for (var i = 0; i < places.length; i++) {
        //     _planList.add(
        //       DropdownMenuItem(
        //         value: places[i],
        //         child: Text("${places[i]['description']} N${_plan[i].price}"),
        //       ),
        //     );
        //   }
        return places;
        
      } else {
        // Handle unexpected response format
        print('Unexpected response format: ${response.body}');
        return [];
      }
    } else {
      // Handle unsuccessful HTTP request
      print('Error making HTTP request: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Handle other unexpected errors
    print('Unexpected error in getNearByPlace: $e');
    return [];
  }
}







Future<void> _showAutoCompleteSearch(BuildContext context) async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: 'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ', // Replace with your own Google Places API key
      mode: Mode.overlay,
      language: "en",
      components: [Component(Component.country, "NG")],
    );

    if (p != null) {
      // Prediction selected, you can handle the selected location here
      // For example, you can get the details of the selected place:
      PlacesDetailsResponse detail =
          await GoogleMapsPlaces(apiKey: 'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ')
              .getDetailsByPlaceId(p.placeId.toString());
      print(detail.result.formattedAddress);
    }
  }










  //  static Future<PredictionModel?> placeAutoComplete({
  //   required String placeInput,
  // }) async {
  //   try {
  //     final querys = <String, dynamic>{
  //       'input': placeInput,
  //       'key': 'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ',
  //     };
  //     final url = Uri.https(
  //       'maps.googleapis.com',
  //       'maps/api/place/autocomplete/json',
  //       querys,
  //     );
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       return PredictionModel.fromJson(jsonDecode(response.body));
  //     } else {
  //       response.body;
  //     }
  //   } on Exception catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return null;
  // }


}

