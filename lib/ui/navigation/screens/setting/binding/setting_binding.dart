import 'package:get/get.dart';
import 'package:multi_store/ui/main/controller/main_controller.dart';
import 'package:multi_store/ui/navigation/screens/setting/controller/setting_controller.dart';

class SettingBinding  extends Bindings{
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
        Get.put<MainController>(MainController());

  }
}