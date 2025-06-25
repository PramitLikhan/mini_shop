import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shop/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() => const {};

// methods to update state
  addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  removeProduct(Product product) {
    if (state.contains(product)) {
      state = state
          .where(
            (element) => element != product,
          )
          .toSet();
    }
  }
}

@riverpod
int cartTotal(Ref ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (Product product in cartProducts) {
    total = total + product.price;
  }
  return total;
}
