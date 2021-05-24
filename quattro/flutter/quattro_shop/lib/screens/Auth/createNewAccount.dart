import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quattro_shop/constants.dart';

// ignore: must_be_immutable
class CreateNewAccount extends StatelessWidget {
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
                        'Welcome To Quattro Shop',
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
                        'Sign up with E-mail and Password',
                        style: GoogleFonts.muli(
                            color: Color(0XFF888888),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * 0.33,
                      ),
                      SignUpForm(),
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

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<String> errors = [];
  Map<String, String> _authData = {
    'email': '',
    'pass': '',
  };
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value)=>_authData['email']=value,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
                return "";
              }
              return null;
            },
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
            style: GoogleFonts.muli(color: Colors.white),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextFormField(
            controller: _passwordController,
            onSaved: (value)=>_authData['pass']=value,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kPassNullError)) {
                setState(() {
                  errors.remove(kPassNullError);
                });
              } else if (value.length > 8 &&
                  errors.contains(kShortPassError)) {
                setState(() {
                  errors.remove(kShortPassError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kPassNullError)) {
                setState(() {
                  errors.add(kPassNullError);
                });
                return "";
              } else if (value.length < 8 &&
                  !errors.contains(kShortPassError)) {
                setState(() {
                  errors.add(kShortPassError);
                });
                return "";
              }
              return null;
            },
            textInputAction: TextInputAction.next,
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
            style: GoogleFonts.muli(color: Colors.white),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextFormField(
            onChanged: (value) {
              if (value==_passwordController.text && errors.contains(kMatchPassError)) {
                setState(() {
                  errors.remove(kMatchPassError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!=_passwordController.text && !errors.contains(kMatchPassError)) {
                setState(() {
                  errors.add(kMatchPassError);
                });
                return "";
              }
              return null;
            },
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
              labelText: 'Confirm Password',
              hintText: 'Enter you Password',
            ),
            style: GoogleFonts.muli(color: Colors.white),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          FormError(errors: errors),
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
              onPressed: () {
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  Navigator.of(context).pushNamed('/');
                }
              },
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
                  'Already have Account,',
                  style: GoogleFonts.muli(color: Colors.white, fontSize: 14),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.muli(
                          color: Colors.deepOrange, fontSize: 16),
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

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: List.generate(
        errors.length,
            (index) => Row(
          children: [
            Icon(
              Icons.clear,
              color: Colors.red,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              errors[index],
              style: GoogleFonts.muli(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


