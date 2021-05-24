import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quattro_shop/models/users.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Auth with ChangeNotifier{


  Future<void> signUp(String fname,String lname,String email,String pass,String phone,String address) async {
    final url =
        'https://10.0.2.2/quattro_shop/api/signup.php';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers:{ "Accept": "application/json" },
        body:
          {
            'fname': fname,
            'lname': lname,
            'email': email,
            'pass': pass,
            'phone': phone,
            'address': address,
            'created_at':DateTime.now().toString(),
          },
      );
      final responseData = json.decode(json.encode(response.body));
      print(responseData.toString());
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

}