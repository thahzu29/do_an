import 'package:flutter/material.dart';
import 'package:multi_store/common/base/controller/subcategory_controller.dart';
import 'package:multi_store/common/base/widgets/details/inner_banner_widget.dart';
import 'package:multi_store/common/base/widgets/details/inner_header_widget.dart';
import 'package:multi_store/common/base/widgets/details/subcategory_tile_widget.dart';
import 'package:multi_store/data/model/subcategory_model.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';

import '../../../../data/model/category_model.dart';

class InnerCategoryContentWidget extends StatefulWidget {
  final Category category;

  const InnerCategoryContentWidget({super.key, required this.category});

  @override
  State<InnerCategoryContentWidget> createState() => _InnerCategoryContentWidgetState();
}

class _InnerCategoryContentWidgetState extends State<InnerCategoryContentWidget> {
  late Future<List<SubCategory>> _subcategories;
  final SubcategoryController _subcategoryController = SubcategoryController();

  @override
  void initState() {
    super.initState();
    _subcategories = _subcategoryController.getSubCategoriesByCategoryName(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: const InnerHeaderWidget(),
      ),
      backgroundColor: AppColors.white40,
      body: Column(
        children: [
          InnerBannerWidget(image: widget.category.banner),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Shop by Category",
              style: AppStyles.STYLE_20_BOLD.copyWith(
                color: AppColors.blackFont,
                letterSpacing: 1.7,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<SubCategory>>(
              future: _subcategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No Subcategories"),
                  );
                } else {
                  final subcategories = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: List.generate((subcategories.length / 7).ceil(), (setIndex) {
                        final start = setIndex * 7;
                        final end = (setIndex + 1) * 7;
                        return Padding(
                          padding: const EdgeInsets.all(8.9),
                          child: Row(
                            children: subcategories
                                .sublist(start, end > subcategories.length ? subcategories.length : end)
                                .map((subcategory) => SubcategoryTileWidget(
                                      image: subcategory.image,
                                      title: subcategory.subCategoryName,
                                    ))
                                .toList(),
                          ),
                        );
                      }),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
