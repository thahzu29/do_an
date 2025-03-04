import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_store/ui/navigation/screens/cart/screen/cart_page.dart';
import 'package:multi_store/ui/navigation/screens/category/screen/category_page.dart';
import 'package:multi_store/ui/navigation/screens/favorite/screen/favorite_page.dart';
import 'package:multi_store/ui/navigation/screens/home/screen/home_page.dart';
import 'package:multi_store/ui/navigation/screens/setting/screen/setting_page.dart';
import 'package:multi_store/ui/navigation/screens/store/screen/store_page.dart';


import '../../../common/base/controller/base_controller.dart';

class MainController extends BaseController {
  static MainController get to => Get.find<MainController>();

 var pageIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
    const CartPage(),
    const CategoryPage(),
    const StorePage(),
    const FavoritePage(),
    const SettingPage(),
  ];

  void changePage(int index) {
    pageIndex.value = index;
    update();
  }
}




