import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timbu_mobile_app/models/product.model.dart';
import 'package:timbu_mobile_app/util/constants/sizes.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.allRoundPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CachedNetworkImage(
                height: 300,
                imageUrl: product.photo,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              product.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
            Text(
              'Stock: ${product.stock}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
            const Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[200],
                    ),
                    child: const Text('Add to Bag'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
