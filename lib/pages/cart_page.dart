import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/component/cart_item_widget.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      'R\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed:
                        cart.itemCount == 0
                            ? null
                            : () {
                              Provider.of<OrderList>(
                                context,
                                listen: false,
                              ).addOrder(cart);

                              cart.clear();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Pedido realizado com sucesso!',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                    child: const Text('COMPRAR'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child:
                items.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 100,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Seu carrinho está vazio!',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      itemCount: items.length,
                      itemBuilder:
                          (ctx, i) => TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 500),
                            tween: Tween(begin: 0.0, end: 1.0),
                            builder:
                                (context, value, child) => Opacity(
                                  opacity: value,
                                  child: Transform.translate(
                                    offset: Offset(50 * (1 - value), 0),
                                    child: child,
                                  ),
                                ),
                            child: CartItemWidget(items[i]),
                          ),
                    ),
          ),
        ],
      ),
    );
  }
}
