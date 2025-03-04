import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/ui/navigation/screens/setting/controller/setting_controller.dart';

class SettingPage extends BasePage<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Setting",
          ),
        ),
      ),
    );
  }
}