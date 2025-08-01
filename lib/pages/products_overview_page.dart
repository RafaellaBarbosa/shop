import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/component/app_drawer.dart';
import 'package:shop/component/badge_custom.dart';
import 'package:shop/component/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _isLoading = true;
  bool _showFavoriteOnly = false;

  @override
  void initState() {
    super.initState();

    Provider.of<ProductList>(context, listen: false).loadProducts().then((
      value,
    ) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
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
                _showFavoriteOnly = true;
              } else {
                _showFavoriteOnly = false;
              }
            },
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.cart);
                },
                icon: BadgeCustom(value: cart.itemCount.toString()),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : ProductGrid(_showFavoriteOnly),
    );
  }
}
