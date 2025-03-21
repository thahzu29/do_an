import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/common/reusable_text_widget.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';
import 'package:multi_store/routes/app_routes.dart';
import 'package:multi_store/common/base/widgets/details/category/inner_category_page.dart';
import 'package:multi_store/ui/navigation/screens/category_page.dart';
import '../../../../../controller/category_controller.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({super.key});

  @override
  _CategoryItemWidgetState createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  final CategoryController _controller = CategoryController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    await _controller.loadCategories();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableTextWidget(
          title: "Categories",
          actionText: "View all",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const CategoryPage()));
          },
        ),
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _controller.categories.isEmpty
            ? const Center(child: Text("No Categories"))
            : GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          itemCount: _controller.categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = _controller.categories[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InnerCategoryPage(category: category),
                  ),
                );
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
        ),
      ],
    );
  }
}
