import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_store/common/base/widgets/app_button.dart';
import 'package:multi_store/common/base/widgets/app_text_field.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/resource/asset/app_images.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';
import 'package:multi_store/routes/app_routes.dart';
import 'package:multi_store/ui/authentication/register/controller/register_controller.dart';

class RegisterPage extends BasePage<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight * 0.4,
            width: double.infinity,
            child: Image.asset(
              AppImages.imgBrSignUp,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "titleRegister".tr,
                            style: AppStyles.STYLE_36_BOLD.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                    AppTextField(
                      hintText: "fullName".tr,
                      prefixImage: AppImages.icUser,
                      onChanged: (value) {
                        controller.fullName = value;
                      },
                    ),
                      const SizedBox(height: 10),
                      AppTextField(
                          hintText: "enterEmail".tr,
                          prefixImage: AppImages.icUser,
                          onChanged: (value) {
                            controller.email = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        AppTextField(
                          hintText: "enterPassword".tr,
                          prefixImage: AppImages.icPassword,
                          isPassword: true,
                          onChanged: (value) {
                            controller.password = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        Obx(() => AppButton(
                              text: "register".tr,
                              isLoading: controller.isLoading.value,
                              onPressed: () {
                                controller.registerUser(context);
                              },
                              color: AppColors.bluePrimary,
                              textColor: AppColors.white,
                            )),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "haveAccount".tr,
                              style: AppStyles.STYLE_16.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(PageName.loginPage);
                              },
                              child: Text(
                                "login".tr,
                                style: AppStyles.STYLE_16_BOLD.copyWith(
                                  color: AppColors.bluePrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
