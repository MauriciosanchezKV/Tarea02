import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.person, size: 80),
            const SizedBox(height: 20),
            Text(
              auth.username ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: const Text("Token"),
                subtitle: Text(auth.token ?? ""),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text("Ubicación GPS"),
                subtitle: Text(
                  auth.position == null
                      ? "No cargada"
                      : "Lat: ${auth.position!.latitude}\nLng: ${auth.position!.longitude}",
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                auth.loadLocation();
              },
              child: const Text("Obtener ubicación"),
            ),
          ],
        ),
      ),
    );
  }
}
