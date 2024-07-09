import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timbu_mobile_app/components/add_to_cart_icon.dart';
import 'package:timbu_mobile_app/util/constants/colors.dart';
import 'package:timbu_mobile_app/views/single_product.dart';
import 'package:timbu_mobile_app/models/product.model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool showAddToCartIcon;
  final Color? tagColor;
  final String? tagText;
  final bool showTag;

  const ProductCard({
    super.key,
    this.tagColor,
    this.tagText,
    this.showTag = false,
    required this.showAddToCartIcon,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(product: product));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        height: 325,
        width: 190,
        color: darkMode ? Colors.black : MyColors.colorLight,
        child: Container(
          decoration: BoxDecoration(
            color: darkMode ? MyColors.colorDark : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: Color(0x3600000F),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: AspectRatio(
                          aspectRatio: 3.5 / 4,
                          child: CachedNetworkImage(
                            imageUrl: product.photo,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: MyColors.secondary),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'stock: ${product.stock}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: MyColors.primary,
                                      fontFamily: "Metropolis-medium"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 160,
                left: 115,
                child: AddToCartButton(
                  addToCart: showAddToCartIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
