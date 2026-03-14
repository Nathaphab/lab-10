import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/user_provider.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';
import 'login_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final cartProvider = context.watch<CartProvider>();
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [

          /// Cart
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
              ),
              if (cartProvider.items.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartProvider.items.length.toString(),
                      style: const TextStyle(
                          fontSize: 10, color: Colors.white),
                    ),
                  ),
                )
            ],
          ),

          /// Logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              userProvider.currentUser = null;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (_, i) {
                final p = productProvider.products[i];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      p.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    title: Text(
                      p.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text('\$${p.price}'),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailScreen(product: p),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}