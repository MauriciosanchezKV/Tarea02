import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  final user = TextEditingController();
  final pass = TextEditingController();

  String? msg;

  void register() async {
    final ok = await Provider.of<AuthProvider>(context, listen: false)
        .register(user.text, pass.text);

    setState(() {
      msg = ok ? "Usuario creado" : "Ya existe el usuario";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: user,
                decoration: const InputDecoration(labelText: "Usuario")),
            TextField(
                controller: pass,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Contraseña")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: register, child: const Text("Registrar")),
            if (msg != null) Text(msg!)
          ],
        ),
      ),
    );
  }
}
