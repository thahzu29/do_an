import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/banner_widget.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/common/base/widgets/category_item_widget.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/ui/navigation/screens/home/controller/home_controller.dart';
import 'package:multi_store/common/base/widgets/hearder_widget.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor: AppColors.white40,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HearderWidget(),
            BannerWidget(),
            CategoryItemWidget(),
            Text("HOME"),
          ],
        ),
      ),
    );
  }
}