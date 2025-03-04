
import 'package:get/get.dart';
import 'package:multi_store/ui/authentication/login/binding/login_binding.dart';
import 'package:multi_store/ui/authentication/login/screen/login_page.dart';
import 'package:multi_store/ui/authentication/register/binding/register_binding.dart';
import 'package:multi_store/ui/authentication/register/screen/register_page.dart';
import 'package:multi_store/ui/navigation/screens/cart/binding/cart_binding.dart';
import 'package:multi_store/ui/navigation/screens/cart/screen/cart_page.dart';
import 'package:multi_store/ui/navigation/screens/category/binding/category_binding.dart';
import 'package:multi_store/ui/navigation/screens/category/screen/category_page.dart';
import 'package:multi_store/ui/navigation/screens/details/inner_category/binding/inner_category_binding.dart';
import 'package:multi_store/ui/navigation/screens/details/inner_category/screen/inner_category_page.dart';
import 'package:multi_store/ui/navigation/screens/favorite/binding/favorite_binding.dart';
import 'package:multi_store/ui/navigation/screens/favorite/screen/favorite_page.dart';
import 'package:multi_store/ui/navigation/screens/home/binding/home_binding.dart';
import 'package:multi_store/ui/navigation/screens/home/screen/home_page.dart';
import 'package:multi_store/ui/navigation/screens/setting/binding/setting_binding.dart';
import 'package:multi_store/ui/navigation/screens/setting/screen/setting_page.dart';
import 'package:multi_store/ui/navigation/screens/store/binding/store_binding.dart';
import 'package:multi_store/ui/navigation/screens/store/screen/store_page.dart';
import 'package:multi_store/ui/started/binding/started_binding.dart';
import 'package:multi_store/ui/started/screen/started_page.dart';

import '../ui/main/binding/main_binding.dart';
import '../ui/main/screen/main_page.dart';
import '../ui/navigation/splash/binding/splash_binding.dart';
import '../ui/navigation/splash/screen/splash_page.dart';

abstract class PageName {
  static const splashPage = '/';
  static const mainPage = '/main';
  static const loginPage = '/login';
  static const startedPage = '/started';
  static const registerPage = '/register';
  static const homePage ='/home';
  static const favoritePage ='/favorite';
  static const cartPage ='/cart';
  static const settingPage = '/setting';
  static const storePage = '/store';
  static const categoryPage = '/category';
  static const innerCategoryPage = '/innerCategory';
}

abstract class Argument {}

class AppPages {
  static final routes = [
    GetPage(
      name: PageName.splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: PageName.startedPage,
      page: () => const StartedPage(),
      binding: StartedBinding(),
    ),
    GetPage(
      name: PageName.categoryPage,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: PageName.loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: PageName.registerPage,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: PageName.mainPage,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: PageName.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PageName.favoritePage,
      page: () => const FavoritePage(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: PageName.cartPage,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: PageName.settingPage,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: PageName.storePage,
      page: () => const StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: PageName.innerCategoryPage,
      page: () => InnerCategoryPage(category: Get.arguments,),
      binding: InnerCategoryBinding(),
    ),
  ];
}
