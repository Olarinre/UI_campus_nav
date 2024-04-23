import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_campus_nav/screens/resetpassword.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
   bool profile = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Profile"),
        elevation: 0,
       
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Stack(
              alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar( radius: 50,
                  backgroundImage: AssetImage("lib/images/uilogo.png"),
                  ),
                  CircleAvatar( radius: 18,
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.camera_alt,color: Colors.white,),
                   ),
          
                ],
              ),
              SizedBox(height: 5,),
              const Text('Adeola Enitan Sunshine',
               style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),),
                        SizedBox(height: 5,),
              const Text('Praisepee@gmail.com',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            
           GestureDetector(
                onTap: () {
                  setState(() {
                    profile = !profile;
                    print(profile);
                  });
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: profile  ? Text(
                     "Edit Profile" ,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ) : Text("Update" ,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                  ), 
                ),
              ),
             design( text: "Name", body: "Adeola Enitan Sunshine" ), 
             design( text: "Username", body: "Addeyforlife1"),
             design( text: "Email", body: "Adeolaenitan@gmail.com"),
             //design( text: "Password", body: "************", icon: Icons.key_off_outlined, 
             
             //),
             Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ResetPassword(),
                        ),
                      );
        },
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password",
             style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("************"),
                IconButton(onPressed: (){
                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const ResetPassword(),
                                    ),
                                  );
                }, icon: Icon(Icons.key_off_outlined))
              ],
            ),
            Divider(),
          ],
        )
      ),
    ),
             design( text: "Address", body: "7, Liberty Road Lekki, Lagos, Nigeria"),
             
            ],
          ),
        ),
      ),
    );
  }






  Widget design({
    String? text, body,
    IconData? icon,
    Function? function,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          function;
        },
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$text",
             style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$body"),
                IconButton(onPressed: (){
                  function;
                }, icon: Icon(icon))
              ],
            ),
            Divider(),
          ],
        )
      ),
    );
  }
}