import 'package:mini_shop/generated/assets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(id: '1', title: 'Groovy Shorts', price: 12, image: Assets.assetsShorts),
  Product(id: '2', title: 'Karati Kit', price: 34, image: Assets.assetsKarati),
  Product(id: '3', title: 'Denim Jeans', price: 54, image: Assets.assetsJeans),
  Product(id: '4', title: 'Red Backpack', price: 14, image: Assets.assetsBackpack),
  Product(id: '5', title: 'Drum & Sticks', price: 29, image: Assets.assetsDrum),
  Product(id: '6', title: 'Blue Suitcase', price: 44, image: Assets.assetsSuitcase),
  Product(id: '7', title: 'Roller Skates', price: 52, image: Assets.assetsSkates),
  Product(id: '8', title: 'Electric Guitar', price: 79, image: Assets.assetsGuitar),
];

@riverpod
List<Product> products(ref) => allProducts;

@riverpod
List<Product> reducedProductsProvider(ref) => allProducts.where((p) => p.price < 50).toList();
