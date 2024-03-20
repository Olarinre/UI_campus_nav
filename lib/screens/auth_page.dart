import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:ui_campus_nav/screens/main_home_screen.dart";
import "package:ui_campus_nav/screens/login_or_register.dart";

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          // is user logged in?
          if (snapshot.hasData) {
            return MainHomeScreen();
            // if not
          } else {
            return const LoginOrRegisterPage();
          }
        }),
      ),
    );
  }
}
