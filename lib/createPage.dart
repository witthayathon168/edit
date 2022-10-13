import 'package:flutter/material.dart';
import 'package:real_project/create_exel.dart';

class YellowBird extends StatefulWidget {
  const YellowBird({super.key});

  @override
  State<YellowBird> createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: Color.fromARGB(245, 243, 230, 215),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          createExcel();
        },
        child: Text("สร้าง excel"),
      )),
    ));
  }
}
