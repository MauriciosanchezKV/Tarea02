import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>?> login(String username, String password) async {
    final data = await _storage.read(key: "users");

    if (data == null) return null;

    List users = jsonDecode(data);

    try {
      final user = users.firstWhere(
        (u) => u["username"] == username && u["password"] == password,
      );

      return {
        "token": "token_${user["username"]}",
        "username": user["username"]
      };
    } catch (_) {
      return null;
    }
  }

  Future<bool> register(String username, String password) async {
    final data = await _storage.read(key: "users");

    List users = data != null ? jsonDecode(data) : [];

    final exists = users.any((u) => u["username"] == username);

    if (exists) return false;

    users.add({
      "username": username,
      "password": password,
    });

    await _storage.write(key: "users", value: jsonEncode(users));

    return true;
  }
}
