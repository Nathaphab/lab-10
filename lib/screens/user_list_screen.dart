import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'user_form_screen.dart';
import 'product_list_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        actions: [

          /// ไปหน้าสินค้า
          IconButton(
            icon: const Icon(Icons.store),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProductListScreen(),
                ),
              );
            },
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const UserFormScreen(),
            ),
          );
        },
      ),

      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (_, i) {

                final u = provider.users[i];

                return ListTile(
                  title: Text('${u.name.firstname} ${u.name.lastname}'),
                  subtitle: Text(u.email),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      /// edit
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => UserFormScreen(editUser: u),
                            ),
                          );
                        },
                      ),

                      /// delete
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          provider.removeUser(u.id!);
                        },
                      ),

                    ],
                  ),
                );
              },
            ),
    );
  }
}