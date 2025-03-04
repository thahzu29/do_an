import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/common/base/widgets/inner_banner_widget.dart';
import 'package:multi_store/common/base/widgets/inner_header_widget.dart';
import 'package:multi_store/data/model/category_model.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';
import 'package:multi_store/ui/navigation/screens/details/inner_category/controller/inner_category_controller.dart';



class InnerCategoryPage extends BasePage<InnerCategoryController> {
  final Category category;

  const InnerCategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: const InnerHeaderWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Shop by categories",
                style: AppStyles.STYLE_18_BOLD.copyWith(
                  color: AppColors.blackFont,
                  letterSpacing: 1.7,
                ),
              ),
            ),
            InnerBannerWidget(image: category.banner ?? ""),
          ],
        ),
      ),
    );
  }
}