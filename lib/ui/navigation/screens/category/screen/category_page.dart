import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/common/base/widgets/hearder_widget.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';
import 'package:multi_store/ui/navigation/screens/category/controller/category_controller.dart';

class CategoryPage extends BasePage<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: const HearderWidget(),
      ),
      body: Row(
        children: [
          // ✅ Sidebar danh mục chính
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.white40,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.categories.isEmpty) {
                  return const Center(child: Text("No categories available"));
                } else {
                  return ListView.builder(
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return Obx(() => ListTile(
                            onTap: () {
                              controller.selectCategory(category);
                            },
                            title: Text(
                              category.name,
                              style: AppStyles.STYLE_14_BOLD.copyWith(
                                color: controller.selectedCategory.value == category
                                    ? AppColors.bluePrimary
                                    : AppColors.black,
                              ),
                            ),
                          ));
                    },
                  );
                }
              }),
            ),
          ),

          Expanded(
            flex: 5,
            child: Obx(() {
              if (controller.selectedCategory.value == null) {
                return const Center(child: Text("Please select a category"));
              }
              final category = controller.selectedCategory.value!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: AppStyles.STYLE_20_BOLD.copyWith(color: AppColors.blackFont),
                    ),
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(category.banner),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Obx(() {
                      if (controller.subcategories.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Center(child: Text("No subcategories available")),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.subcategories.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          final subcategory = controller.subcategories[index];
                          return Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: AppColors.white40,
                                ),
                                child: Center(
                                  child: Image.network(
                                    subcategory.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Center(
                                  child: Text(
                                subcategory.subCategoryName,
                                style: AppStyles.STYLE_14_BOLD.copyWith(
                                  color: AppColors.blackFont,
                                ),
                              )),
                            ],
                          );
                        },
                      );
                    }),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
