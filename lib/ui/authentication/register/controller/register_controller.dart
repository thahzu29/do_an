import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_store/common/base/controller/base_controller.dart';
import 'package:multi_store/ui/authentication/auth_controller.dart';

class RegisterController extends BaseController {
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";
  String fullName = "";
  String password = "";
  var isLoading = false.obs; 

  void registerUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    
    isLoading.value = true;
    
    await _authController.signUpUsers(
      context: context,
      email: email,
      fullName: fullName,
      password: password,
    ).whenComplete(() {
      isLoading.value = false;
    });
  }
}
