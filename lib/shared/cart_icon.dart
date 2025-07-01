import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_shop/providers/cart_provider.dart';
import 'package:mini_shop/router/app_pages.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final numberOfItemsInCart = ref.watch(cartNotifierProvider).length;
    return Stack(
      children: [
        IconButton(
          onPressed: () => context.push(AppPages.cart),
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: Text(
              numberOfItemsInCart.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
