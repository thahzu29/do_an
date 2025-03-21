import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/common/reusable_text_widget.dart';
import 'package:multi_store/common/base/widgets/details/products/popular_product_widget.dart';

import '../../../common/base/widgets/details/banner/banner_widget.dart';
import '../../../common/base/widgets/common/hearder_widget.dart';
import '../../../common/base/widgets/details/category/category_item_widget.dart';
import '../../../resource/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white40,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            BannerWidget(),
            CategoryItemWidget(),
            const SizedBox(height: 5),
            ReusableTextWidget(
              title: "Popular Products",
              actionText: "View all",
              onPressed: () {},
            ),
           const  PopularProductWidget(),
          ],
        ),
      ),
    );
  }
}
