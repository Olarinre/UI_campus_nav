import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/direction.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';

class AgricDepartment extends StatefulWidget {
  const AgricDepartment({super.key});

  @override
  State<AgricDepartment> createState() => _AgricDepartmentState();
}

class _AgricDepartmentState extends State<AgricDepartment> {
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
                      builder: (_) =>  MapScreen(mydestination: 'Department of Animal Science',),
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
                        mydestination: 'faculty of Agrictulture',
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
                      builder: (_) => MapScreens(
                        mydestination: 'Department of Forest resources Management',
                      ),
                    ),
                  );
                },
              child: design(department: "Department of Forest resources Management"))
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
