import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/providers/cart_provider.dart';

import '../../models/product.dart' show Product;

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((e) => CartProduct(product: e)).toList(),
            ),
            Text('Total: $total'),
          ],
        ),
      ),
    );
  }
}

class CartProduct extends ConsumerWidget {
  const CartProduct({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(product.image, height: 60, width: 60),
          SizedBox(
            width: 10,
          ),
          Text(product.title),
          Spacer(),
          Text(product.price.toString()),
          TextButton(
            onPressed: () => ref.read(cartNotifierProvider.notifier).removeProduct(product),
            child: Text('Remove'),
          )
        ],
      ),
    );
  }
}
