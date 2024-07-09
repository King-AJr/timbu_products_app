import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timbu_mobile_app/components/grid_layout.dart';
import 'package:timbu_mobile_app/components/product_card.dart';
import 'package:timbu_mobile_app/controllers/product.controller.dart';
import 'package:timbu_mobile_app/util/constants/sizes.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          // Show loading indicator or placeholder
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: GridLayout(
              itemCount: productController.allProducts.length,
              mainAxisExtent: 310,
              itemBuilder: (_, index) {
                final product = productController.allProducts[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.allRoundPadding,
                    top: Sizes.allRoundPadding,
                  ),
                  child: ProductCard(
                    product: product,
                    showAddToCartIcon: false,
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
