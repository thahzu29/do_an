import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/common/hearder_widget.dart';
import 'package:multi_store/common/base/widgets/details/category/subcategory_tile_widget.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';
import '../../../controller/category_controller.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryController controller = CategoryController();

  @override
  void initState() {
    super.initState();
    controller.loadCategories().then((_) {
      for (var category in controller.categories) {
        if (category.name == "Electronic") {
          controller.selectCategory(category);
          break;
        }
      }
    });

    controller.notifier.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: const HeaderWidget(),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Sidebar danh mục chính
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.white40,
              child: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : controller.categories.isEmpty
                  ? const Center(child: Text("No categories available"))
                  : ListView.builder(
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return ListTile(
                    onTap: () {
                      setState(() {
                        controller.selectCategory(category);
                      });
                    },
                    title: Text(
                      category.name,
                      style: AppStyles.STYLE_14_BOLD.copyWith(
                        color: controller.selectedCategory == category
                            ? AppColors.bluePrimary
                            : AppColors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: controller.selectedCategory == null
                ? const Center(child: Text("Please select a category"))
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.selectedCategory!.name,
                      style: AppStyles.STYLE_20_BOLD.copyWith(color: AppColors.blackFont),
                    ),
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(controller.selectedCategory!.banner),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    controller.isLoadingSubcategories
                        ? const Center(child: CircularProgressIndicator())
                        : controller.subcategories.isEmpty
                        ? const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Center(child: Text("No subcategories available")),
                    )
                        : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.subcategories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 4,
                        childAspectRatio: 2 / 3,
                      ),
                      itemBuilder: (context, index) {
                        final subcategory = controller.subcategories[index];
                        return SubcategoryTileWidget(
                          image: subcategory.image,
                          title: subcategory.subCategoryName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
