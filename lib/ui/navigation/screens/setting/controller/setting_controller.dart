import 'package:flutter/cupertino.dart';
import 'package:multi_store/common/base/controller/base_controller.dart';
import 'package:multi_store/ui/authentication/auth_controller.dart';

class SettingController extends BaseController{

  final AuthController _authController = AuthController();

  Future<void> signOutUser(BuildContext context) async{
    await _authController.signOutUser(context: context);
  }
}