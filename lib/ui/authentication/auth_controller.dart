import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_store/data/model/user_model.dart';
import 'package:multi_store/global_variables.dart';
import 'package:multi_store/services/manage_http_response.dart';
import 'package:multi_store/ui/authentication/login/screen/login_page.dart';
import 'package:multi_store/ui/main/screen/main_page.dart';

class AuthController {
  Future<void> signUpUsers({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      // Tao doi tuong User voi du lieu nguoi dung
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          password: password,
          token: ''
      );

      // Goi API dang ky nguoi dung
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body:
        user.toJson(), // Chuyen doi tuong User thanh JSON de gui len server
        headers: <String, String>{
          "Content-Type":
          'application/json; charset=UTF-8', // Dinh dang noi dung la JSON
        },
      );

      // Xu ly phan hoi tu server
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          showSnackBar(context, "Account has been Created for you");
        },
      );
    } catch (e) {
      print("Error in signUpUsers: $e");
    }
  }
  // sign in users function

  Future<void> signInUsers(
      {required context,
        required String email,
        required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode(
            {
              'email': email,
              'password': password,
            },
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const  MainPage()),(route)=>false);
            //  showSnackBar(context, "Login Success");
          });
    } catch (e) {
      print("Error: $e");
    }
  }
}