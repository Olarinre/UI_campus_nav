import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Faculty of Medicine"),
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
              Row(
                children: [
                  Text(
                    "Department",
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 18),
                  ),
                ],
              ),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Human Nutrition',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Human Nutrition")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Obstetricsy',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Obstetrics")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Opthalmology',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Opthalmology")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Forest Paediatrics',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Forest Paediatrics")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Radiotherapy',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Radiotherapy")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Surgery',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Surgery")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Biochemistry',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Biochemistry")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Medicine',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Medicine")),
              GestureDetector(
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Physiology',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Physiology")),
              GestureDetector(
                
                 onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Psychiatry',
                        ),
                      ),
                    );
                  },
                  child: design(department: "Department of Psychiatry"))
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