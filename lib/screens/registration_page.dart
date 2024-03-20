import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_campus_nav/ui_c%20omponents/login_button.dart';
import 'package:ui_campus_nav/ui_c%20omponents/textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign user up function
  void signUserUp() async {
    //circular progressbar while logging in
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try creating a new user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message if passowrds dont match
        showErrorMessage("passwords don't match.");
      }
      ;

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  //wrong email message
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Color.fromARGB(255, 120, 86, 212)),
            ),
          ),
        );
      },
    );
  }

  //wrong password message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.blue,
      //   ),
      //backgroundColor: Color.fromARGB(255, 250, 246, 246),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 10),

                  const Icon(
                    Icons.lock,
                    size: 100,
                    color: Color.fromARGB(255, 2, 21, 124),
                  ),

                  const Text(
                    'Please enter your details below!.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // email textfield

                  const Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  EmailField(
                    controller: emailController,
                  ),

                  const SizedBox(height: 10),
                  // password textfield

                  const Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  PasswordField(
                    hinttext: 'Enter your password',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //confirm password
                  const Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  PasswordField(
                    hinttext:
                        "confirm your password", //still try to display the appropriate text here.
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(height: 20),

                  LoginButton(
                    text: "Sign up",
                    onTap: signUserUp,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Text('Or Sign in with'),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/images/google-logo-history-png-2603.png",
                            height: 50,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text('sign in with Google'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//password field changing icon\

