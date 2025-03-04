import 'package:get/get.dart';
import 'package:multi_store/ui/main/controller/main_controller.dart';
import 'package:multi_store/ui/navigation/screens/store/controller/store_controller.dart';

class StoreBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<StoreController>(StoreController());
        Get.put<MainController>(MainController());

  }
}