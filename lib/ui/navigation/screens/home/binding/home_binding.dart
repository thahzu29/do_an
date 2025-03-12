import 'package:get/get.dart';
import 'package:multi_store/ui/main/controller/main_controller.dart';
import 'package:multi_store/ui/navigation/screens/home/controller/home_controller.dart';

import '../../category/controller/category_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
        Get.put<MainController>(MainController());
    Get.put<CategoryController>(CategoryController());

  }
}