import 'package:get/get.dart';
import 'package:multi_store/ui/main/controller/main_controller.dart';
import 'package:multi_store/ui/navigation/screens/favorite/controller/favorite_controller.dart';

class FavoriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<FavoriteController>(FavoriteController());
        Get.put<MainController>(MainController());

  }
}