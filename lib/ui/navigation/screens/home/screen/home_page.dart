import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:multi_store/common/base/widgets/common/app_navigation_bar.dart';
import 'package:multi_store/common/base/widgets/common/banner_widget.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/common/base/widgets/details/category_item_widget.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/ui/navigation/screens/home/controller/home_controller.dart';
import 'package:multi_store/common/base/widgets/common/hearder_widget.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white40,
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              BannerWidget(),
              CategoryItemWidget(),
              Text("HOME"),
            ],
          ),
        ),

    );
  }
}