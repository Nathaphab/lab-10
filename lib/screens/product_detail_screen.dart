import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Text(product.description),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  cart.addToCart(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart'),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}