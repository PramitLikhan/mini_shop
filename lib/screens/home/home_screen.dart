import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/providers/cart_provider.dart';
import 'package:mini_shop/providers/products_provider.dart';

import '../../shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) => GridView.builder(
            itemCount: allProducts.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: constraints.maxWidth / 4,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => ProductWidget(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends ConsumerWidget {
  const ProductWidget({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, ref) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final allProducts = ref.watch(productsProvider);
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blueGrey.withOpacity(0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            allProducts[index].image,
            height: 60,
            width: 60,
          ),
          Text(allProducts[index].title),
          Text('\$${allProducts[index].price}'),
          if (cartProducts.contains(allProducts[index]))
            TextButton(
              onPressed: () => ref
                  .read(
                    cartNotifierProvider.notifier,
                  )
                  .removeProduct(allProducts[index]),
              child: const Text('Remove'),
            ),
          if (!(cartProducts.contains(allProducts[index])))
            TextButton(
              onPressed: () => ref
                  .read(
                    cartNotifierProvider.notifier,
                  )
                  .addProduct(allProducts[index]),
              child: const Text('Add to Cart'),
            )
        ],
      ),
    );
  }
}
