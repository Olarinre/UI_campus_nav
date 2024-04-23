import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GeneralPrefrence extends StatefulWidget {
  const GeneralPrefrence({super.key});

  @override
  State<GeneralPrefrence> createState() => _GeneralPrefrenceState();
}

class _GeneralPrefrenceState extends State<GeneralPrefrence> {
  bool mile = true, km = false, voice = true , sound = false, screen = true, route = true, lock = false, navigate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        elevation: 0,
        //backgroundColor: Color.fromARGB(133, 223, 222, 222),
        centerTitle: true,
        leading: IconButton(onPressed: () {Navigator.pop(context); }, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("General Preference",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Language",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10,),
              const Text("English(UK)",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Distance Units",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                mile = !mile;
                                km = !km;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                 color: mile ?Colors.blue.shade900 : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child:  Padding(
                                padding:  EdgeInsets.all(2.0),
                                child:  Center(
                                  child: Text(
                                    "Mile",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: mile
                                            ? Colors.grey.shade300
                                            : Colors.blue.shade900),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                               setState(() {
                                mile = !mile;
                                km = !km;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                color: km ?Colors.blue.shade900 : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child:  Padding(  
                                padding: const EdgeInsets.all(3.0),
                                child: Center(
                                  child: Text(
                                    "Km",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: km
                                            ? Colors.grey.shade300
                                            : Colors.blue.shade900),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text("Voice Instructions", style: TextStyle( fontSize: 18, fontWeight: FontWeight.w500),),
                  Switch(value: voice, onChanged: (value){
                    setState(() {
                          voice = value;
                        });
                  },
                  activeTrackColor: Colors.blue.shade900,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  )
          
                ],
              ),
              SizedBox( height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sounds",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: sound,
                    onChanged: (value) {
                      setState(() {
                        sound = value;
                      });
                    },
                    activeTrackColor: Colors.blue.shade900,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
              SizedBox( height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Full Screen",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: screen,
                    onChanged: (value) {
                      setState(() {
                        screen = value;
                      });
                    },
                    activeTrackColor: Colors.blue.shade900,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Routes Suggesstion",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: voice,
                    onChanged: (value) {
                      setState(() {
                        voice = value;
                      });
                    },
                    activeTrackColor: Colors.blue.shade900,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
              SizedBox( height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Prevent auto-lock",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: lock,
                    onChanged: (value) {
                      setState(() {
                        lock = value;
                      });
                    },
                    activeTrackColor: Colors.blue.shade900,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                    "Keeps Uni-Ibadan Navigator on top",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text("Uni-Ibadan Navigator will be visible\n when making calls",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Switch(
                    value: navigate,
                    onChanged: (value) {
                      setState(() {
                        navigate = value;
                      });
                    },
                    activeTrackColor: Colors.blue.shade900,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
