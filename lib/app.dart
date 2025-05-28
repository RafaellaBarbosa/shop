import 'package:flutter/material.dart';
import 'package:shop/pages/products_overview_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Lato'),
      home:  ProductsOverviewPage(),
      showSemanticsDebugger: false,
    );
  }
}
