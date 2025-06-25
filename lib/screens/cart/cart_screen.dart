import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/providers/cart_provider.dart';

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
              children: cartProducts
                  .map(
                    (e) => Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Image.asset(e.image, height: 60, width: 60),
                          SizedBox(
                            width: 10,
                          ),
                          Text(e.title),
                          Spacer(),
                          Text(e.price.toString()),
                        ],
                      ),
                    ),
                  )
                  .toList(), // output cart products here
            ),

            // output totals here
            Text('Total: $total'),
          ],
        ),
      ),
    );
  }
}
