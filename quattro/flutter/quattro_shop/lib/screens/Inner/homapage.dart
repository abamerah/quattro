import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.only(left: size.width * 0.25),
            child: Text(
              'Sign Up',
              style:
              GoogleFonts.muli(color: Color(0XFF888888), fontSize: 22),
            )),
        backgroundColor: Colors.black,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Center(child: Text('Homepage')),
      ),
    );
  }
}
