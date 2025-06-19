import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/component/app_drawer.dart';
import 'package:shop/component/product_item.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductList>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.productForm);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child:
              products.items.isEmpty
                  ? Center(child: Text('Nenhum produto encontrado'))
                  : ListView.builder(
                    itemCount: products.itemsCount,
                    itemBuilder: (ctx, i) => ProductItem(products.items[i]),
                  ),
        ),
      ),
    );
  }
}
