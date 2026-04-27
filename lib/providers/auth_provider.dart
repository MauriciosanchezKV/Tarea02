import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';

import '../services/auth_service.dart';
import '../services/location_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final LocationService _locationService = LocationService();

  // 🔐 AUTH DATA
  String? _token;
  String? _username;

  // 📍 LOCATION DATA
  Position? _position;

  // GETTERS
  String? get token => _token;
  String? get username => _username;
  Position? get position => _position;

  bool get isAuthenticated => _token != null;

  // =========================
  // 🔐 LOGIN
  // =========================
  Future<void> login(String username, String password) async {
    final response = await _authService.login(username, password);

    if (response != null) {
      _token = response["token"];
      _username = response["username"];

      await _storage.write(key: "token", value: _token);
      await _storage.write(key: "username", value: _username);

      notifyListeners();
    } else {
      throw Exception("Credenciales incorrectas");
    }
  }

  // =========================
  // 📝 REGISTER
  // =========================
  Future<bool> register(String username, String password) async {
    return await _authService.register(username, password);
  }

  // =========================
  // 🔁 LOAD SESSION
  // =========================
  Future<void> loadSession() async {
    _token = await _storage.read(key: "token");
    _username = await _storage.read(key: "username");

    notifyListeners();
  }

  // =========================
  // 📍 LOAD LOCATION
  // =========================
  Future<void> loadLocation() async {
    _position = await _locationService.getLocation();
    notifyListeners();
  }

  // =========================
  // 🚪 LOGOUT
  // =========================
  Future<void> logout() async {
    _token = null;
    _username = null;
    _position = null;

    await _storage.deleteAll();

    notifyListeners();
  }
}
