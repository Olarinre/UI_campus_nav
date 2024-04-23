import 'package:flutter/material.dart';

class RecentlyVisited extends StatefulWidget {
  const RecentlyVisited({super.key});

  @override
  State<RecentlyVisited> createState() => _RecentlyVisitedState();
}

class _RecentlyVisitedState extends State<RecentlyVisited> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Female Hostels"),
        elevation: 0,
        //backgroundColor: Color.fromARGB(133, 223, 222, 222),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}