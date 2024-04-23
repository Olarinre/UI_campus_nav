import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';
import 'package:ui_campus_nav/ui_c%20omponents/listof%20hostel.dart';

class FemaleHostel extends StatefulWidget {
  const FemaleHostel({super.key});

  @override
  State<FemaleHostel> createState() => _FemaleHostelState();
}

class _FemaleHostelState extends State<FemaleHostel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Female Hostels"),
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
                        mydestination: 'Chard Anderson road UI',
                      ),
                    ),
                  );
                },
                child: HostelsDesign(
                    department: "Queen Idia Hall",
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
                        mydestination: 'Chard Anderson road UI',
                      ),
                    ),
                  );
                },
                child: HostelsDesign(
                    department: "Obafemi Awolowo Hall",
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
                        mydestination: 'Chard Anderson road UI',
                      ),
                    ),
                  );
                },
                child: HostelsDesign(
                    department: "Queen Elizabeth HAll",
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
                        mydestination: 'Chard Anderson road UI',
                      ),
                    ),
                  );
                },
                child: HostelsDesign(
                    department: "Abdusalam Hall",
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
                        mydestination: 'Chard Anderson road UI',
                      ),
                    ),
                  );
                },
                child: HostelsDesign(
                    department: "St. Annes Hall",
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