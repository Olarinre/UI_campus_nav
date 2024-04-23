import 'package:flutter/material.dart';

class MapSettings extends StatefulWidget {
  const MapSettings({super.key});

  @override
  State<MapSettings> createState() => _MapSettingsState();
}

class _MapSettingsState extends State<MapSettings> {
  bool mile = true,
      km = false,
      voice = true,
      sound = false,
      screen = true,
      route = true,
      lock = false,
      compass = true,
      navigate = true;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Map",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Map Type",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 40,
                    width: 150,
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
                              width: 70,
                              decoration: BoxDecoration(
                                color: mile
                                    ? Colors.blue.shade900
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Center(
                                  child: Text(
                                    "Satellite",
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
                                color: km
                                    ? Colors.blue.shade900
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Center(
                                  child: Text(
                                    "Map",
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "3D map view",
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Detailed Roads",
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Zoom Buttons",
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Collapse Zoom Buttons",
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Map Rotaion",
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
              SizedBox(
                height: 10,
              ),
              Divider(),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Change scale with volume",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
              ),
              Divider(),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Compass",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: compass,
                    onChanged: (value) {
                      setState(() {
                        compass = value;
                      });
                    },
                    activeTrackColor: Colors.blue.shade900,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}