import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HostelsDesign extends StatefulWidget {
  final String department, image, street;
  final Color? color;
  bool save, sam;
  HostelsDesign(
      {super.key,
      required this.department,
      required this.image,
      required this.street,
     
      this.color,
      required this.save,
      required this.sam});

  @override
  State<HostelsDesign> createState() => _HostelsDesignState();
}

class _HostelsDesignState extends State<HostelsDesign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Container(
        height: 80,
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
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(widget.image)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.department,
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.street),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: Icon(Icons.subdirectory_arrow_right, color: Colors.yellow,),
                  ),
                  SizedBox(width: 10,),
                  // IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         widget.save = !widget.save;
                  //         print(widget.save);
                  //       });
                  //     },
                  //     icon: widget.save
                  //         ? Icon(
                  //             Icons.bookmark_border,
                  //             color: Colors.blue.shade900,
                  //           )
                  //         : Icon(
                  //             Icons.bookmark,
                  //             color: Colors.blue.shade900,
                  //           )),
                  GestureDetector(
                    onTap: () {
                       setState(() {
                        widget.sam = !widget.sam;
                        print(widget.save);
                      });
                    },
                    child: CircleAvatar(
                      
                      backgroundColor:widget.sam ? Colors.blue.shade900 : Colors.white,
                      child: Icon(
                        Icons.bookmark_border,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         widget.sam = !widget.sam;
                  //         print(widget.save);
                  //       });
                  //     },
                  //     icon: widget.sam
                  //         ? Icon(
                  //             Icons.bookmark_border,
                  //             color: Colors.blue.shade900,
                  //           )
                  //         : Icon(
                  //             Icons.bookmark,
                  //             color: Colors.blue.shade900,
                  //           )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
