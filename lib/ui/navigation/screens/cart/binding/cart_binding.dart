import 'package:get/get.dart';
import 'package:multi_store/ui/main/controller/main_controller.dart';
import 'package:multi_store/ui/navigation/screens/cart/controller/cart_controller.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<CartController>(CartController());
        Get.put<MainController>(MainController());

  }
}