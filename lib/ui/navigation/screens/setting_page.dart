import 'package:flutter/material.dart';
import 'package:multi_store/ui/authentication/auth_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final AuthController _authController = AuthController();

  Future<void> _signOutUser(BuildContext context) async {
    await _authController.signOutUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await _signOutUser(context);
            },
            child: const Text("Sign Out"),
          ),
        ),
      ),
    );
  }
}
