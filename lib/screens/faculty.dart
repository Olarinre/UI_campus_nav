import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/agric.dart';
import 'package:ui_campus_nav/screens/arts.dart';
import 'package:ui_campus_nav/screens/education.dart';
import 'package:ui_campus_nav/screens/medicine.dart';
import 'package:ui_campus_nav/screens/social.dart';
import 'package:ui_campus_nav/ui_c%20omponents/design.dart';

class FacultyList extends StatefulWidget {
  const FacultyList({super.key});

  @override
  State<FacultyList> createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
   bool edu= true, art =false, soc = true, agric =true , med = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faculties"),
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
                onTap: (){
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AgricDepartment(),
                    ),
                  );
                },
                child: Mydesign(
                  image: "lib/images/facultyimage.jpeg",
                  save: agric,
                  department: "Faculty of Agric & forestry",
                  street: "Chad Ander road, UI",
                  number: "Departments: 8"
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Myart(),
                    ),
                  );
                },
                child: Mydesign(
                  image: "lib/images/facultyimage.jpeg",
                  save: art,
                    department: "Faculty of Arts",
                    street: "Chad Ander road, UI",
                    number: "Departments: 8"),
              ),
                    SizedBox(
                height: 30,
              ),
                   GestureDetector(
                    onTap: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Education(),
                    ),
                  );
                    },
                     child: Mydesign(
                      image: "lib/images/facultyimage.jpeg",
                      save: edu,
                                       department: "Faculty of Education",
                                       street: "Chad Ander road, UI",
                                       number: "Departments: 5"),
                   ),
               SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Medicine(),
                    ),
                  );
                },
                child: Mydesign(
                  image: "lib/images/facultyimage.jpeg",
                  save: med,
                    department: "College of Medicine",
                    street: "Chad Ander road, UI",
                    number: "Departments: 1"),
              ),
                    SizedBox(
                height: 30,
              ),
                   GestureDetector(
                    onTap: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Social(),
                    ),
                  );
                    },
                     child: Mydesign(
                      image: "lib/images/facultyimage.jpeg",
                      save: soc,
                                       department: "Faculty of Social Science",
                                       street: "Chad Ander road, UI",
                                       number: "Departments: 4"),
                   ),
              SizedBox(
                height: 15,
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  Widget design({
    String? department,
    String? image,
    String? street,
    String? number,
    Color? color,
    required bool save 
    //dynamic page,
  }) {
  bool save = true;
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("$image")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$department", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                    Text("$street"),
                    Text("$number"),
                  ],
                )
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    save = ! save;
                    print(save);
                  });
                },
                icon:  save ? Icon( Icons.bookmark_border, color: Colors.blue.shade900,) :Icon(Icons.bookmark, color: Colors.blue.shade900,) ),
          ],
        ),
      ),
    );
  }
}
