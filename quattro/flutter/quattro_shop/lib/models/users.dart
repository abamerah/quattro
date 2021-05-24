
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Users {

  int id;
  final String fname;
  final String lname;
  final String email;
  final String pass;
  final String phone;
  final String address;
  String created_at;

  Users({
      @required this.fname,
      @required this.lname,
      @required this.email,
      @required this.pass,
      @required this.phone,
      @required this.address,
  });

}