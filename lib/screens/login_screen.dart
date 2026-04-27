import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final user = TextEditingController();
  final pass = TextEditingController();

  bool loading = false;
  String? error;

  void login() async {
    setState(() => loading = true);

    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .login(user.text, pass.text);
    } catch (_) {
      setState(() => error = "Credenciales inválidas");
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tarea02 - Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: user,
                decoration: const InputDecoration(labelText: "Usuario")),
            TextField(
                controller: pass,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Contraseña")),
            const SizedBox(height: 20),
            if (error != null)
              Text(error!, style: const TextStyle(color: Colors.red)),
            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: login, child: const Text("Entrar")),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
              child: const Text("Crear cuenta"),
            )
          ],
        ),
      ),
    );
  }
}
