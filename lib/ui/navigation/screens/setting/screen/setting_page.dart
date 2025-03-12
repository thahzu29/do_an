import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/ui/authentication/auth_controller.dart';
import 'package:multi_store/ui/navigation/screens/setting/controller/setting_controller.dart';

class SettingPage extends BasePage<SettingController> {
  SettingPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
              onPressed: () async {
                await controller.signOutUser(context);
              },
              child: const Text("SignOut")),
        ),
      ),
    );
  }
}
