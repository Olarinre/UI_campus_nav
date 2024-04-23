import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       appBar: AppBar(
        title: Text("Privacy Policy"),
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text("How can we help you?",
                style: TextStyle(
                  fontSize: 22,
                  
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20,),
              Icon(Icons.location_on_outlined, size: 100, color: Colors.blue.shade900,),
            SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Container(
                    height: 180,
                    width: 160,
                    
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
                      // image: DecorationImage(
                      //     fit: BoxFit.cover, image: AssetImage(image[index])
                      //     ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.remove_from_queue_sharp, size: 50, color: Colors.blue.shade900,),
                          const Text("FAQ",
                            style: TextStyle(
                              fontSize: 20,
                             
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text("Find answer to coomn questions", textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 15,
                             
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 160,
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
                      // image: DecorationImage(
                      //     fit: BoxFit.cover, image: AssetImage(image[index])
                      //     ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail_outline,
                            size: 50,
                            color: Colors.blue.shade900,
                          ),
                          const Text(
                            "Email Us",
                            style: TextStyle(
                              fontSize: 20,
                              
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "We are always there to help you",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 160,
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
                      // image: DecorationImage(
                      //     fit: BoxFit.cover, image: AssetImage(image[index])
                      //     ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            size: 50,
                            color: Colors.blue.shade900,
                          ),
                          const Text(
                            "Call Us",
                            style: TextStyle(
                              fontSize: 20,
                              
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "We are always here to help you",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 160,
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
                      // image: DecorationImage(
                      //     fit: BoxFit.cover, image: AssetImage(image[index])
                      //     ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 50,
                            color: Colors.blue.shade900,
                          ),
                          const Text(
                            "Chat with us",
                            style: TextStyle(
                              fontSize: 20,
                             
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "Ask us anything, or share your feedback",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
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