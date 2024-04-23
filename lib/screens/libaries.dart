import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';
import 'package:ui_campus_nav/ui_c%20omponents/listof%20hostel.dart';


class MyLibary extends StatefulWidget {
  const MyLibary({super.key});

  @override
  State<MyLibary> createState() => _MyLibaryState();
}

class _MyLibaryState extends State<MyLibary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Libaries"),
        elevation: 0,
        //backgroundColor: Color.fromARGB(133, 223, 222, 222),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>  MapScreen(mydestination: 'Kenneth Dike Libary',),
                  ),
                );
              },
            child: HostelsDesign(department: "Kenneth Dike Libary", image: "lib/images/hostelimage1.jpeg", street: "Chard Anderson road UI",  save: true, sam: false))
        ],
      ),
    );
  }
}