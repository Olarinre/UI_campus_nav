import 'package:flutter/material.dart';

class InternetSettings extends StatefulWidget {
  const InternetSettings({super.key});

  @override
  State<InternetSettings> createState() => _InternetSettingsState();
}

class _InternetSettingsState extends State<InternetSettings> {
  bool traffic = true, download = false, mobile = true, backup = true ;
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

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
             const Row(
               children: [
                 Text(
                  "Internet",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                             ),
               ],
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Use Mobile Data",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Mobile internet is needed to display \ndetailed information about places",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                Switch(
                  value:mobile,
                  onChanged: (value) {
                    setState(() {
                      mobile = value;
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
                  "Backup Bookmarks",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: backup,
                  onChanged: (value) {
                    setState(() {
                      backup = value;
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
                  "Auto-download",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: download,
                  onChanged: (value) {
                    setState(() {
                      download = value;
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
                  "Traffic",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: traffic,
                  onChanged: (value) {
                    setState(() {
                      traffic = value;
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
    );
  }
}