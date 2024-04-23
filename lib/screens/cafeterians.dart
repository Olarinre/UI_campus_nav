import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';

class Cafeterias extends StatefulWidget {
  const Cafeterias({super.key});

  @override
  State<Cafeterias> createState() => _CafeteriasState();
}

class _CafeteriasState extends State<Cafeterias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafeterials"),
        elevation: 0,
        //backgroundColor: Color.fromARGB(133, 223, 222, 222),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
             
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Queens Cafeteria',
                        ),
                      ),
                    );
                  },
                child: design(department: "Queens Cafeteria")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Klass Cafeteria',
                        ),
                      ),
                    );
                  },
                child: design(department: "Klass Cafeteria")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Idia Ofada Spot',
                        ),
                      ),
                    );
                  },
                child: design(department: "Idia Ofada Spot")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Mellanye Cafeteria',
                        ),
                      ),
                    );
                  },
                child: design(department: "Mellanye Cafeteria")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Indy Cafeteria',
                        ),
                      ),
                    );
                  },
                child: design(department: "Indy Cafeteria")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Awo Cafeteria',
                        ),
                      ),
                    );
                  },
                child: design(department: "Awo Cafeteria")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'New Flava Cafeteria',
                        ),
                      ),
                    );
                  },
                child: design(department: "New Flava Cafeteria")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Boluid Cafeteria',
                        ),
                      ),
                    );
                  },
                child: design(department: "Boluid Cafeteria")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination:
                              'Alexandra Brown cafe',
                        ),
                      ),
                    );
                  },
                child: design(department: "Alexandra Brown cafe")),
            ],
          ),
        ),
      ),
    );
  }

   Widget design({
    String? department,

    //dynamic page,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$department",
              style: TextStyle(fontSize: 15),
            ),
            Icon(
              Icons.rotate_90_degrees_cw,
              color: Colors.blue.shade900,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Divider(),
      ],
    );
  }
}