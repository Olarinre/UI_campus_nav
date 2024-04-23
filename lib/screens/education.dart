import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty of Agriculture and Forestry"),
        elevation: 0,
        //backgroundColor: Color.fromARGB(133, 223, 222, 222),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
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
                        mydestination: 'Department of Animal Science',
                      ),
                    ),
                  );
                },
              child: design(department: "Department of Animal Science")),
            GestureDetector(
               onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Department of Agrictultural Economics',
                      ),
                    ),
                  );
                },
              child: design(department: "Department of Agrictultural Economics")),
            GestureDetector(
               onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Department of Agronomy',
                      ),
                    ),
                  );
                },
              child: design(department: "Department of Agronomy")),
            GestureDetector(
              
               onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        mydestination: 'Department of Forest Management',
                      ),
                    ),
                  );
                },
                child: design(department: "Department of Forest Management"))
          ],
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