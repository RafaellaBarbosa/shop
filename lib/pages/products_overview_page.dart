import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/component/badge_custom.dart';
import 'package:shop/component/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products Overview'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text('Favorites'),
                ),
                PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text('All Products'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == FilterOptions.favorites) {
                provider.toggleShowFavoritesOnly();
              } else {
                provider.toggleShowAllProducts();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 36.0),
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                return IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.cart);
                  },
                  icon: BadgeCustom(value: cart.itemCount.toString()),
                );
              },
            ),
          ),
        ],
      ),

      body: ProductGrid(),
    );
  }
}
