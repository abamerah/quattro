import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/audi_logo.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      Container(
                        width: size.width*0.5,
                        child: Image.asset('assets/image/logoWhite.png'),
                      ),
                      SizedBox(
                        height: size.height * 0.26,
                      ),
                      Text(
                        'Welcome to Quattro Shop, \n Here you can purchase Spare Parts \n Reserve Appointment Maintainence or other Services',
                        style: GoogleFonts.muli(
                            color: Color(0XFF888888),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Container(
                        width: size.width*0.8,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.muli(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
