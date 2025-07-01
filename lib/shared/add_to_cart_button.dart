import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

class AddToCartButton extends ConsumerWidget {
  const AddToCartButton({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInCart = ref.watch(
      cartNotifierProvider.select((list) => list.contains(product)),
    );
    final notifier = ref.read(cartNotifierProvider.notifier);
    final buttonText = isInCart ? 'Remove' : 'Add to Cart';

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isInCart ? Colors.red.withAlpha(30) : Colors.green.withAlpha(30),
        foregroundColor: isInCart ? Colors.red : Colors.green,
      ),
      onPressed: () => isInCart ? notifier.removeProduct(product) : notifier.addProduct(product),
      child: Text(buttonText),
    );
  }
}
