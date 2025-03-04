import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/ui/navigation/screens/store/controller/store_controller.dart';

class StorePage extends BasePage<StoreController> {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Store",
          ),
        ),
      ),
    );
  }
}
