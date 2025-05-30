import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductList())],
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
          AppRoutes.productsOverview: (context) => ProductsOverviewPage(),
          AppRoutes.productDetail: (context) => const ProductDetailPage(),
        },
      ),
    );
  }
}
