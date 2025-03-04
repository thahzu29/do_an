import 'package:get/get.dart';
import 'package:multi_store/ui/navigation/screens/category/controller/category_controller.dart';
import 'package:multi_store/ui/main/controller/main_controller.dart';
import 'package:multi_store/ui/navigation/screens/cart/controller/cart_controller.dart';
import 'package:multi_store/ui/navigation/screens/home/controller/home_controller.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
        Get.put<MainController>(MainController());
    Get.put<HomeController>(HomeController());
  }
}