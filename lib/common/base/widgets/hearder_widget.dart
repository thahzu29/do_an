import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_store/common/base/widgets/custom_search.dart';
import 'package:multi_store/resource/asset/app_images.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';

import '../../../routes/app_routes.dart';

class HearderWidget extends StatelessWidget {
  const HearderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      child: Stack(
        children: [
          Image.asset(
            AppImages.imgSearchBanner,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const CustomSearch(),
          // Text(
          //   "Eazezy",
          //   style: AppStyles.STYLE_36_BOLD.copyWith(
          //     color: AppColors.black,
          //   ),
          // ),
          // Positioned(
          //   left: 340,
          //   top: 78,
          //   child: Material(
          //     type: MaterialType.transparency,
          //     child: InkWell(
          //         onTap: () {},
          //         child: Ink(
          //           width: 31,
          //           height: 31,
          //           decoration:const BoxDecoration(
          //             image: DecorationImage(
          //               image: AssetImage(AppImages.imgMessage),
          //             ),
          //           ),
          //         )),
          //   ),
          // ),

          // Positioned(
          //   left: 290,
          //   top: 78,
          //   child: Material(
          //     type: MaterialType.transparency,
          //     child: InkWell(
          //         onTap: () {},
          //         child: Ink(
          //           width: 31,
          //           height: 31,
          //           decoration:const BoxDecoration(
          //             image: DecorationImage(
          //               image: AssetImage(AppImages.imgNoti),
          //             ),
          //           ),
          //         )),
          //   ),
          // ),
        ],
      ),
    );
  }
}
