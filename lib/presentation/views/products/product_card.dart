import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';
import 'package:yomo_ecommerce/presentation/resources/styles_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: AppSize.s200,
        height: AppSize.s200,
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: AppSize.s100,
              height: AppSize.s150,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
              child: Text(
                product.name,
                style: getSemiBoldTextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'Price: \$${product.price.toString()}',
              style: getRegularTextStyle(color: Colors.black),
            ),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: () {}, child: const Icon(Icons.edit))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {},
                        child: const Icon(Icons.delete)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
