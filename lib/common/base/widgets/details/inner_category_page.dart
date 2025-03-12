import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_store/common/base/controller/subcategory_controller.dart';
import 'package:multi_store/common/base/widgets/common/app_navigation_bar.dart';
import 'package:multi_store/common/base/widgets/details/inner_banner_widget.dart';
import 'package:multi_store/common/base/widgets/details/inner_category_content_widget.dart';
import 'package:multi_store/common/base/widgets/details/inner_header_widget.dart';
import 'package:multi_store/data/model/subcategory_model.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';
import 'package:multi_store/ui/navigation/screens/cart/screen/cart_page.dart';
import 'package:multi_store/ui/navigation/screens/category/screen/category_page.dart';
import 'package:multi_store/ui/navigation/screens/favorite/screen/favorite_page.dart';
import 'package:multi_store/ui/navigation/screens/setting/screen/setting_page.dart';
import 'package:multi_store/ui/navigation/screens/store/screen/store_page.dart';

import '../../../../data/model/category_model.dart';

class InnerCategoryPage extends StatefulWidget {
  final Category category;

  const InnerCategoryPage({super.key, required this.category});

  @override
  State<InnerCategoryPage> createState() => _InnerCategoryPageState();
}

class _InnerCategoryPageState extends State<InnerCategoryPage> {
  late Future<List<SubCategory>> _subcategories;
  final SubcategoryController _subcategoryController = SubcategoryController();

  int pageIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _subcategories = _subcategoryController.getSubCategoriesByCategoryName(widget.category.name);
    pages = [
      InnerCategoryContentWidget(category: widget.category),
      const CartPage(),
      const CategoryPage(),
      const StorePage(),
      const FavoritePage(),
       SettingPage(),
    ];
  }

  void changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white40,
      body: pages[pageIndex],
      bottomNavigationBar: AppNavigationBar(
        selectedIndex: pageIndex,
        onTabSelected: (index) {
          changePage(index);
        },
      ),
    );
  }
}
