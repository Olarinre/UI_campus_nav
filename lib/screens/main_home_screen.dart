import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//this is the homepage

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  int currentndex = 0;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Welcome Username!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Where are you going today?"),
                      ],
                    ),
                  ],
                  //place their profile pic here
                ),

                SizedBox(
                  height: 20,
                ),
                //searchbar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(190, 190, 190, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white10,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //explore the university text
                Text("Explore the University"),
                SizedBox(
                  height: 15,
                ),

                //row1 widget containing faculty and hostel clickable images
                Row(
                  children: [
                    ClickableSizedBox(
                      backgroundImage: "lib/images/facultyimage.jpeg",
                      text: "Faculty",
                    ),
                    ClickableSizedBox(
                      backgroundImage: "lib/images/hostelimage1.jpeg",
                      text: "Hostels",
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //row2 widget containing libraries and cafeterias clickable images
                Row(
                  children: [
                    ClickableSizedBox(
                      backgroundImage: "lib/images/libraryimage.jpeg",
                      text: "Library",
                    ),
                    ClickableSizedBox(
                      backgroundImage: "lib/images/cafeteriaimage.jpeg",
                      text: "Cafeterias",
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // row widget containing recently visted texxt and see all

                //bottom navigation bar to naviage to other section of  the app.
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 2, 21, 124),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Saved',
              icon: Icon(
                Icons.bookmark,
                color: Color.fromARGB(255, 2, 21, 124),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(255, 2, 21, 124),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.man,
                color: Color.fromARGB(255, 2, 21, 124),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//explore the university image section

class ClickableSizedBox extends StatelessWidget {
  final String backgroundImage;
  final String text;
  final Function()? onTap;

  const ClickableSizedBox(
      {required this.backgroundImage,
      required this.text,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Border radius of 10
        child: SizedBox(
          width: 100, // Adjust the size according to your requirement
          height: 100, // Adjust the size according to your requirement
          child: Stack(
            children: [
              Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
