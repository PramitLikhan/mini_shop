import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/models/product.dart';
import 'package:mini_shop/providers/products_provider.dart';

import '../../shared/add_to_cart_button.dart';
import '../../shared/cart_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Garage Sale Products'),
          actions: const [CartIcon()],
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: ProductGrid(), // stateless container
        ),
      );
}

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = (constraints.maxWidth ~/ 200).clamp(1, 8);
        return GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (_, i) => ProductWidget(product: products[i]),
        );
      },
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(product.image, height: 60, width: 60),
              RepaintBoundary(child: Text('${product.title} \$${product.price}')),
              AddToCartButton(product: product),
            ],
          ),
        ),
      );
}
