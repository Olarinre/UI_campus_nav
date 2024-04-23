import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
   TextEditingController pass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  bool _obscureText = true, passkey = true, cpasskey = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 237, 250),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.key_off_outlined, size: 40, color: Colors.blue.shade900,),
              ),
               const SizedBox(
                height: 10,
              ),
               const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              const Text(
                'Enter your current password to reset',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current Password",
                     style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    obscureText: _obscureText,
                    controller: pass,
                    decoration: InputDecoration(
                    
                      hintText: '*************',
                      //label:
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 240, 238, 238),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white10,
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 240, 238, 238),
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: const Color.fromARGB(255, 2, 21, 124),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              _obscureText = !_obscureText;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox( height: 20,),
        
                   const Text(
                    "New Password",
                    style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    obscureText: passkey,
                    controller: newpass,
                    decoration: InputDecoration(
                      hintText: '*************',
                      //label:
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 240, 238, 238),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white10,
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 240, 238, 238),
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          passkey ? Icons.visibility : Icons.visibility_off,
                          color: const Color.fromARGB(255, 2, 21, 124),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              passkey = !passkey;
                            },
                          );
                        },
                      ),
                    ),
                  ),
        
                  SizedBox(height: 20,),
        
                   const Text(
                    "Confirm New Password",
                    style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    obscureText: cpasskey,
                    controller: cpass,
                    decoration: InputDecoration(
                      hintText: '*************',
                      //label:
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 240, 238, 238),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white10,
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 240, 238, 238),
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          cpasskey ? Icons.visibility : Icons.visibility_off,
                          color: const Color.fromARGB(255, 2, 21, 124),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              cpasskey = !cpasskey;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox( height: 20,),
        
                  
                ],
              ),
              GestureDetector(
                    onTap: () {
                       showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Container(
                     height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child:  Text("Update  Password",
                         style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
   AlertDialog alert =  AlertDialog(
   
    
    content: Container(
      height: 350,
      //width: 400,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined))
            ],
          ),
         const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 50,
            child: Icon(Icons.done_rounded, size: 70, color: Colors.white,),
          ), 
          const SizedBox(height: 30,),
           const Text(
            'Password Reset Successful!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              //letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          
          const Text(
            'After selecting text, you can set a shortcut key to display the Context Menu.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    
  );
}