import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_store/common/base/widgets/common/custom_app_bar.dart';
import 'package:multi_store/provider/cart_provider.dart';
import 'package:multi_store/resource/asset/app_images.dart';
import 'package:multi_store/resource/theme/app_colors.dart';
import 'package:multi_store/resource/theme/app_style.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String selectedPaymentMethod = 'stripe';

  @override
  Widget build(BuildContext context) {
    final cartData = ref.read(cartProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: "Thanh toán"),
      backgroundColor: AppColors.white40,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Khung địa chỉ giao hàng
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 90,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.white40),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.white40,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.icPosition,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Thêm địa chỉ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Việt Nam",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Đà Nẵng",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      AppImages.icEdit,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Tiêu đề danh sách sản phẩm
            Text(
              "Sản phẩm",
              style: AppStyles.STYLE_18_BOLD.copyWith(color: AppColors.blackFont),
            ),

            const SizedBox(height: 12),

            /// Danh sách sản phẩm trong giỏ hàng
            Expanded(
              child: ListView.separated(
                itemCount: cartData.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final cartItem = cartData.values.toList()[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.white40),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 78,
                          height: 78,
                          decoration: BoxDecoration(
                            color: AppColors.gold700,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            cartItem.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.productName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.STYLE_16.copyWith(color: AppColors.blackFont),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                cartItem.category,
                                style: AppStyles.STYLE_12.copyWith(color: Colors.grey),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${cartItem.quantity} x ${cartItem.productPrice}đ",
                                style: AppStyles.STYLE_12_BOLD.copyWith(color: AppColors.pink),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            /// Phương thức thanh toán
            Text(
              "Phương thức thanh toán",
              style: AppStyles.STYLE_18_BOLD.copyWith(color: AppColors.blackFont),
            ),
            const SizedBox(height: 8),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Stipe",
                style: AppStyles.STYLE_16.copyWith(color: AppColors.blackFont),
              ),
              value: 'stripe',
              groupValue: selectedPaymentMethod,
              onChanged: (String? value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Thanh toán khi nhận hàng",
                style: AppStyles.STYLE_16.copyWith(color: AppColors.blackFont),
              ),
              value: 'cashOnDelivery',
              groupValue: selectedPaymentMethod,
              onChanged: (String? value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
