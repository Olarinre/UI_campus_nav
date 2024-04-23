import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/dynamic.dart';
import 'package:ui_campus_nav/screens/maps.dart';

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty of Social Science"),
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
                          mydestination: 'Department of Music',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Music")),
              GestureDetector(
                
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Religious Studies',
                        ),
                      ),
                    );
                  },
                  child: design(department: "Department of Religious Studies")),
              GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Pholosophy',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Pholosophy")),
              GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Threater Art',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Threater Art")),
              GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of European Studies',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of European Studies")),
              GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of History',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of History")),
              GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Communication & \nLanguage Art',
                        ),
                      ),
                    );
                  },
                child: design(department: "Department of Communication & \nLanguage Art")),
              GestureDetector(
                
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MapScreen(
                          mydestination: 'Department of Arabic and Religious \nStudies',
                        ),
                      ),
                    );
                  },
                  child: design(department: "Department of Arabic and Religious \nStudies"))
            ],
          ),
        ),
      ),
    );
    ;
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