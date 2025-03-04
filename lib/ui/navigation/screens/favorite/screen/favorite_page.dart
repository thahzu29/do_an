import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/base_page_widget.dart';
import 'package:multi_store/ui/navigation/screens/favorite/controller/favorite_controller.dart';

class FavoritePage extends BasePage<FavoriteController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Favorite",
          ),
        ),
      ),
    );
  }
}