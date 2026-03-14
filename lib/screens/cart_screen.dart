import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (_, i) {
                final item = cart.items[i];
                return ListTile(
                  title: Text(item.product.title),
                  subtitle: Text('Qty: ${item.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => cart.decrease(item.product),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => cart.increase(item.product),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => cart.remove(item.product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
          )
        ],
      ),
    );
  }
}