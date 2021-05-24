import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecorationTheme inputDecorationTheme(){
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42,vertical: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.white),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.white),
      gapPadding: 10,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.red),
      gapPadding: 10,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.red),
      gapPadding: 10,
    ),
    hintStyle: GoogleFonts.muli(color: Colors.white),
    labelStyle: GoogleFonts.muli(color: Colors.white),
  );
}

