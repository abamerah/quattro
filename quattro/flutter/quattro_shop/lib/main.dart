import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quattro_shop/providers/auth.dart';
import 'package:quattro_shop/screens/Auth/createNewAccount.dart';
import 'package:quattro_shop/screens/Auth/login.dart';
import 'package:quattro_shop/screens/Inner/homapage.dart';
import 'package:quattro_shop/screens/splash.dart';
import 'package:quattro_shop/themes.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme: inputDecorationTheme(),
          primarySwatch: Colors.blue,
        ),
        //home: LoginScreen(),
        initialRoute: '/splash',
        routes: {
          '/':(ctx)=>Homepage(),
          '/register':(ctx)=>CreateNewAccount(),
          '/login':(ctx)=>Login(),
          '/splash':(ctx)=>Splash(),
        },
      ) ,

    );
  }
}

