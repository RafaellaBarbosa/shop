import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/auth_or_home_page.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList('', []),
          update: (ctx, auth, previous) {
            return ProductList(auth.token ?? '', previous?.items ?? []);
          },
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.purple,
          canvasColor: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.purple,
            titleTextStyle: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              color: Colors.white,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,

        routes: {
          AppRoutes.authOrHome: (ctx) => const AuthOrHomePage(),
          AppRoutes.productDetail: (context) => const ProductDetailPage(),
          AppRoutes.cart: (context) => const CartPage(),
          AppRoutes.orders: (context) => const OrdersPage(),
          AppRoutes.products: (context) => const ProductsPage(),
          AppRoutes.productForm: (context) => const ProductFormPage(),
        },
      ),
    );
  }
}
