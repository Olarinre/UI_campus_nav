import 'package:flutter/material.dart';

class Mydesign extends StatefulWidget {
  final String department, image, street, number;
    final Color? color;
    bool save ;
   Mydesign({super.key, required this.department,  required this.image, required this.street, required this.number, this.color,  required this.save});

  @override
  State<Mydesign> createState() => _MydesignState();
}

class _MydesignState extends State<Mydesign> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
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
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.image)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.department, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                    Text(widget.street),
                    Text(widget.number),
                  ],
                )
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.save = ! widget.save;
                    print(widget.save);
                  });
                },
                icon:  widget.save ? Icon( Icons.bookmark_border, color: Colors.blue.shade900,) :Icon(Icons.bookmark, color: Colors.blue.shade900,) ),
          ],
        ),
      ),
    );
  }
}