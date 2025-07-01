import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/providers/cart_provider.dart';

import '../../models/product.dart' show Product;
import '../../shared/add_to_cart_button.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
          centerTitle: true,
          // actions: [],
        ),
        body: const Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [Expanded(child: CartList()), CartTotal()],
          ),
        ),
      );
}

class CartTotal extends ConsumerWidget {
  const CartTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final total = ref.watch(cartTotalProvider);
    return Text('Total: $total');
  }
}

class CartList extends ConsumerWidget {
  const CartList({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final cartProducts = ref.watch(cartNotifierProvider);
    return Column(
      children: cartProducts.map((e) => CartProduct(product: e)).toList(),
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
  Widget build(BuildContext context, ref) => Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.asset(product.image, height: 60, width: 60),
            SizedBox(width: 10),
            Text(product.title),
            Spacer(),
            Text(product.price.toString()),
            SizedBox(width: 10),
            AddToCartButton(product: product),
          ],
        ),
      );
}
