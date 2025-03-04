import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_store/common/base/widgets/reusable_text_widget.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';
import 'package:multi_store/routes/app_routes.dart';
import '../../../ui/navigation/screens/category/controller/category_controller.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.find<CategoryController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableTextWidget(
          title: "Categories",
          actionText: "View all",
          onPressed: () {
            Get.toNamed(PageName.categoryPage);
          },
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.categories.isEmpty) {
            return const Center(child: Text("No Categories"));
          } else {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              itemCount: controller.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return InkWell(
                    onTap: (){
                      Get.toNamed(PageName.innerCategoryPage,arguments: category);
                    },
                  child: Column(
                    children: [
                      Image.network(
                        category.image,
                        height: 47,
                        width: 47,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                        },
                      ),
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: AppStyles.STYLE_12_BOLD.copyWith(
                          color: AppColors.blackFont,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }),
      ],
    );
  }
}
