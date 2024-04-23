

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/aboutus.dart';
import 'package:ui_campus_nav/screens/general_settings.dart';
import 'package:ui_campus_nav/screens/internet_setting.dart';
import 'package:ui_campus_nav/screens/map_settings.dart';
import 'package:ui_campus_nav/screens/notification.dart';
import 'package:ui_campus_nav/screens/privacy.dart';
import 'package:ui_campus_nav/screens/resetpassword.dart';
import 'package:ui_campus_nav/screens/support.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(133, 223, 222, 222),
      appBar: AppBar(
        title: Text("Settings"),
        elevation: 0,
        backgroundColor: Color.fromARGB(133, 223, 222, 222),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>   const GeneralPrefrence(),
                              ),
                            );
                },
                child: design(
                  text: 'General Preference',
                  icon: Icons.app_settings_alt_outlined,
                 
                ),
              ),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InternetSettings(),
                    ),
                  );
                },
                child: design(
                  text: 'Internet Settings',
                  icon: Icons.settings_remote_outlined,
                  // function:
                  // Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (_) => (),
                  //               ),
                  //             );
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Notifications(),
                    ),
                  );
                },
                child: design(
                  text: 'Notificarion Settings',
                  icon: Icons.notifications_outlined,
                  // function:
                  // Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (_) => (),
                  //               ),
                  //             );
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MapSettings(),
                                ),
                              );
                },
                child: design(
                  text: 'Map Settings',
                  icon: Icons.location_on_outlined,
                  // function:
                  // Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (_) => (),
                  //               ),
                  //             );
                ),
              ),
              design(
                text: 'Clear search and route history',
                icon: Icons.cleaning_services_outlined,
                // function:
                // Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (_) => (),
                //               ),
                //             );
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AboutUs(),
                                ),
                              );
                },
                child: design(
                  text: 'About',
                  icon: Icons.info_outline,
                  // function:
                  
                ),
              ),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Privacy(),
                                ),
                              );
                },
                child: design(
                  text: 'Privacy Policy',
                  icon: Icons.app_settings_alt_outlined,
                  // function:
                  // Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (_) => (),
                  //               ),
                  //             );
                ),
              ),
              GestureDetector(
                onTap: (){
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Support(),
                                ),
                              );
                },
                child: design(
                  text: 'Spport',
                  icon: Icons.app_settings_alt_outlined,
                  // function:
                  // Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (_) => (),
                  //               ),
                  //             );
                ),
              ),
              design(
                text: 'Logout',
                icon: Icons.app_settings_alt_outlined,
                color: Colors.red
                // function:
                // Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (_) => (),
                //               ),
                //             );
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget design({
    String? text,
    IconData? icon,
    Color? color
    //dynamic page,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          color: Colors.white,
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
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      // image: DecorationImage(
                      //     fit: BoxFit.cover,
                      //     image: AssetImage(image[index])),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$text",
                    style: TextStyle(
                      fontSize: 15,
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
