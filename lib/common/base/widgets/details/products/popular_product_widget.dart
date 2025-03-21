import 'package:flutter/material.dart';
import 'package:multi_store/common/base/widgets/details/products/product_item_widget.dart';
import 'package:multi_store/controller/product_controller.dart';

import '../../../../../data/model/product.dart';

class PopularProductWidget extends StatefulWidget {
  const PopularProductWidget({super.key});

  @override
  State<PopularProductWidget> createState() => _PopularProductWidgetState();
}

class _PopularProductWidgetState extends State<PopularProductWidget> {
  late Future<List<Product>> futurePopularProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePopularProducts = ProductController().loadPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futurePopularProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error ${snapshot.error}",
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("Không có sản phẩm"),
            );
          } else {
            final products = snapshot.data;
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return  ProductItemWidget(product: product,);
                },
              ),
            );
          }
        });
  }
}
