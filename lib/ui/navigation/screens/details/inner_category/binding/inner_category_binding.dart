import 'package:get/get.dart';
import 'package:multi_store/ui/navigation/screens/details/inner_category/controller/inner_category_controller.dart';

class InnerCategoryBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<InnerCategoryController>(InnerCategoryController());
  }

}