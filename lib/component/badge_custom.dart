import 'package:flutter/material.dart';

class BadgeCustom extends StatelessWidget {
  const BadgeCustom({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: Theme.of(context).canvasColor,
      label: Text(
        value.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Icon(Icons.shopping_cart, color: Colors.white),
    );
  }
}
