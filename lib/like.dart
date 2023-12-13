import 'package:flutter/material.dart';

class Likepage extends StatefulWidget {
  const Likepage({super.key});

  @override
  State<Likepage> createState() => _LikepageState();
}

class _LikepageState extends State<Likepage> {
  var ctr = Colors.black;
  var ctrx = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setctr();
            },
            icon: Icon(Icons.thumb_up),
            iconSize: 40,
            color: ctr),
        IconButton(
            onPressed: () {
              setctrx();
            },
            icon: Icon(Icons.thumb_down),
            iconSize: 40,
            color: ctrx),
      ],
    );
  }

  void setctr() {
    setState(() {
      if (ctr == Colors.black) {
        if (ctrx == Colors.blue) {
          ctrx = Colors.black;
        }
        ctr = Colors.blue;
      } else {
        ctr = Colors.black;
      }
    });
  }

  void setctrx() {
    setState(() {
      if (ctrx == Colors.black) {
        if (ctr == Colors.blue) {
          ctr = Colors.black;
        }
        ctrx = Colors.blue;
      } else {
        ctrx = Colors.black;
      }
    });
  }
}
