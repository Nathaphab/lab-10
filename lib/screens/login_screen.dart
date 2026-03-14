import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';
import 'product_list_screen.dart';
import 'user_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUsers();
    });
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    final provider = context.read<UserProvider>();

    final username = usernameCtrl.text.trim();
    final password = passwordCtrl.text.trim();

    UserModel? foundUser;

    try {
      foundUser = provider.users.firstWhere(
        (u) =>
            (u.username ?? '').trim().toLowerCase() ==
                username.toLowerCase() &&
            (u.password ?? '').trim() == password,
      );
    } catch (_) {
      foundUser = null;
    }

    if (foundUser != null) {
      // เก็บผู้ใช้ที่ login
      provider.currentUser = foundUser;

      // debug ดูค่าจริงใน console
      debugPrint('LOGIN USER: ${foundUser.username}');

      // ⭐ ถ้าเป็น johnd → เข้า UserListScreen
      if ((foundUser.username ?? '').trim().toLowerCase() == 'johnd') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const UserListScreen(),
          ),
        );
      } else {
        // user ปกติ → ProductListScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ProductListScreen(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: usernameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              provider.isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: _handleLogin,
                        child: const Text('Login'),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}