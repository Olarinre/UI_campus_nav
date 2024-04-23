import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:ui_campus_nav/screens/cafeterians.dart';
import 'package:ui_campus_nav/screens/direction.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/faculty.dart';
import 'package:ui_campus_nav/screens/google.dart';
import 'package:ui_campus_nav/screens/hostel.dart';
import 'package:ui_campus_nav/screens/libaries.dart';
import 'package:ui_campus_nav/screens/maps.dart';
import 'package:http/http.dart' as http;
import 'package:ui_campus_nav/screens/savepage.dart';
import 'package:ui_campus_nav/screens/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> place = [
    'Faculty',
    'Hostels',
    'Libaries',
    'Cafetarias',
  ];
  String nearByAPIKey = '';
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: 'AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ');
       final PlacesService _placesService =
      PlacesService('AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ');
  List<String> _suggestions = [];
  //int me = 5;

  List<String> image = [
    'lib/images/facultyimage.jpeg',
    'lib/images/hostelimage1.jpeg',
    'lib/images/librayimage.jpeg',
    'lib/images/cafeteriaimage.jpeg',
  ];
   TextEditingController destinationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Username!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Where are you going today?",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("lib/images/facultyimage.jpeg"),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(   mydestination: destinationController.text,
                      ),
                    ),
                  );
                },
                child: TextFormField(
                  // obscureText: cpasskey,
                 onChanged: (value) async {
                       log("message");
                  final suggestions = await _placesService.fetchSuggestions(value);
                setState(() {
                  _suggestions = suggestions;
                 // log(_suggestions as String);
                });
                 },
                  controller: destinationController,
                  onEditingComplete: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: destinationController.text,
                        ),
                      ),
                    );
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
                          setState(
                            () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MapScreen(
                                    mydestination: destinationController.text,
                                  ),
                                ),
                              );
                              //cpasskey = !cpasskey;
                            },
                          );
                        },
                      ),
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
          //  Expanded(
          //    child: Column(
          //     children: [
          //        Flexible(
          //        child: ListView.builder(
          //           itemCount: _suggestions.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(_suggestions[index]),
          //             );
          //           },
          //         ),
          //      ),
          //     ],
          //    ),
          //  ),
           Column(
            children: List.generate(_suggestions.length, (index) => GestureDetector(
              onTap: () {
                setState(() {
                   destinationController.text = _suggestions[index] ;
                });
              },
              child: Text(_suggestions[index]))),
           ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Explore the University',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 16,
                spacing: 12,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //spacing: 30,
                children: List.generate(
                  place.length,
                  (index) => GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FacultyList(),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MyHostel(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MyLibary(),
                            ),
                          );
                        } else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Cafeterias(),
                            ),
                          );
                        } else {}
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(image[index])),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              place[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recently Visited',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>   GoogleMaps(),
                          ),
                        );
                  }, child: Text('See all'))
                ],
              ),
              Column(
                children: List.generate(
                  place.length,
                  (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MapScreen(
                              mydestination:
                                  'Faculty of Social Science',
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade900,
                                    // image: DecorationImage(
                                    //     fit: BoxFit.cover,
                                    //     image: AssetImage(image[index])),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Faculty of Social Science",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Chad Adeodun road, Ui north",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text('1.8km')
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  Future<List<Map<String, dynamic>>> getNearByPlace({
    required Position userLocation,
    String? keyWord,
    required String type,
    required double radius,
  }) async {
    try {
      // Null check for API key and other required values
      nearByAPIKey = "AIzaSyCiIQPMEb3otDsYQ5U8Vej6_8t3gSEoaYQ";
      if (nearByAPIKey == null ||
          userLocation == null ||
          userLocation.latitude == null ||
          userLocation.longitude == null ||
          type == null) {
        throw ArgumentError(
            'Invalid parameters: API key or required location information is missing.');
      }

      // Check if keyWord is null or empty, and provide a default value
      final keywordParam =
          keyWord?.isNotEmpty == true ? '&keyword=$keyWord' : '';

      final url = Uri.https(
        'maps.googleapis.com',
        '/maps/api/place/nearbysearch/json',
        {
          'location': '${userLocation.latitude},${userLocation.longitude}',
          'radius': '$radius',
          'type': type,
          'key': nearByAPIKey!,
          ...Uri.splitQueryString(keywordParam),
        },
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        final responseBody = jsonDecode(response.body);
        if (responseBody is Map<String, dynamic> &&
            responseBody.containsKey('results')) {
          List<dynamic> results = responseBody['results'];
          List<Map<String, dynamic>> places =
              results.cast<Map<String, dynamic>>();
          print(responseBody);

          print('LAT:${userLocation.latitude}');
          print('LONG:${userLocation.longitude}');
          print('Radius:${radius}');
          print('PLACES: $places');
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



}
