import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          appBar: AppBar(
            title: Container(
                margin: EdgeInsets.only(left: size.width * 0.25),
                child: Text(
                  'Sign In',
                  style:
                      GoogleFonts.muli(color: Color(0XFF888888), fontSize: 22),
                )),
            backgroundColor: Colors.black,
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.muli(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Sign in with E-mail and Password',
                        style: GoogleFonts.muli(
                            color: Color(0XFF888888),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * 0.34,
                      ),
                      SignInForm(),
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

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              labelText: 'Email',
              hintText: 'Enter you Email',
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                labelText: 'Password',
                hintText: 'Enter you Password',
              ),
            ),
          SizedBox(
            height: size.height * 0.02,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password ?',
                  style: GoogleFonts.muli(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepOrange,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Continue',
                style: GoogleFonts.muli(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  'Create New Account,',
                  style: GoogleFonts.muli(color: Colors.white, fontSize: 14),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context,'/register');
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.muli(color: Colors.deepOrange, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
