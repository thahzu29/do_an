import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/ui/navigation/screens/cart/controller/cart_controller.dart';

class CartPage extends BasePage<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Cart",
          ),
        ),
      ),
    );
  }
}