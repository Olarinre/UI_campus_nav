import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';
import 'package:ui_campus_nav/ui_c%20omponents/listof%20hostel.dart';




class MaleHostel extends StatefulWidget {
  const MaleHostel({super.key});

  @override
  State<MaleHostel> createState() => _MaleHostelState();
}

class _MaleHostelState extends State<MaleHostel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Male Hostels"),
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
          
                 GestureDetector(
                   onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Kuti Hall',
                      ),
                    ),
                  );
                },
                   child: HostelsDesign(
                    department: "Kuti Hall",
                    image: "lib/images/hostelimage1.jpeg",
                    street: "Chard Anderson road UI",
                    save: true,
                    sam: false),
                 ),
                   GestureDetector(
                     onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Kenneth Dike Libary',
                      ),
                    ),
                  );
                },
                     child: HostelsDesign(
                                       department: "Tender Hall",
                                       image: "lib/images/hostelimage1.jpeg",
                                       street: "Chard Anderson road UI",
                                       save: true,
                                       sam: false),
                   ),
                 
              GestureDetector(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Independece Hall',
                      ),
                    ),
                  );
                },
                child: HostelsDesign(
                    department: "Independece Hall",
                    image: "lib/images/hostelimage1.jpeg",
                    street: "Chard Anderson road UI",
                    save: true,
                    sam: false),
              ),
                   GestureDetector(
                     onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Nnamdi Azikiwe Hall',
                      ),
                    ),
                  );
                },
                     child: HostelsDesign(
                                       department: "Nnamdi Azikiwe Hall",
                                       image: "lib/images/hostelimage1.jpeg",
                                       street: "Chard Anderson road UI",
                                       save: true,
                                       sam: false),
                   ),
                    GestureDetector(
                       onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Mellanby Hall',
                      ),
                    ),
                  );
                },
                      child: HostelsDesign(
                                        department: "Mellanby Hall",
                                        image: "lib/images/hostelimage1.jpeg",
                                        street: "Chard Anderson road UI",
                                        save: true,
                                        sam: false),
                    ),
                    GestureDetector(
                       onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Sultan Bellow Hall',
                      ),
                    ),
                  );
                },
                      child: HostelsDesign(
                                        department: "Sultan Bellow Hall",
                                        image: "lib/images/hostelimage1.jpeg",
                                        street: "Chard Anderson road UI",
                                        save: true,
                                        sam: false),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}