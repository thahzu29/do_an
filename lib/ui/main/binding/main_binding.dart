import 'package:get/get.dart';
import 'package:multi_store/ui/authentication/login/controller/login_controller.dart';
import 'package:multi_store/ui/navigation/screens/cart/controller/cart_controller.dart';
import 'package:multi_store/ui/navigation/screens/category/controller/category_controller.dart';
import 'package:multi_store/ui/navigation/screens/favorite/controller/favorite_controller.dart';
import 'package:multi_store/ui/navigation/screens/home/controller/home_controller.dart';
import 'package:multi_store/ui/navigation/screens/setting/controller/setting_controller.dart';
import 'package:multi_store/ui/navigation/screens/store/controller/store_controller.dart';
import '../controller/main_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<LoginController>(LoginController());
    Get.put<CartController>(CartController());
    Get.put<FavoriteController>(FavoriteController());
    Get.put<HomeController>(HomeController());
    Get.put<SettingController>(SettingController());
    Get.put<StoreController>(StoreController());
    Get.put<CategoryController>(CategoryController());

  }
}
