import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/component/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderList>(context);
    final orders = orderList.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pedidos')),
      body:
          orders.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 100,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Nenhum pedido realizado ainda!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (ctx, i) {
                  final order = orders[i];
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 500 + i * 100),
                    builder:
                        (context, value, child) => Opacity(
                          opacity: value,
                          child: Transform.scale(scale: value, child: child),
                        ),
                    child: OrderWidget(order: order),
                  );
                },
              ),
    );
  }
}
