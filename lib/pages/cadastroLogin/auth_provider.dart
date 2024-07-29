import 'package:flutter/material.dart';
import 'bd.dart'; // Importa o arquivo com o DatabaseHelper

class AuthProvider with ChangeNotifier {
  Map<String, dynamic>? _user;

  Map<String, dynamic>? get user => _user;

  Future<void> login(String identifier, String password) async {
    final dbHelper = DatabaseHelper();
    final user = await dbHelper.getUser(identifier);
    if (user != null && user['password'] == password) {
      _user = user;
      notifyListeners();
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> register(String name, String phone, String email, String password) async {
    final dbHelper = DatabaseHelper();
    final id = await dbHelper.insertUser({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'points': 0,
    });
    _user = {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'points': 0,
    };
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  Future<void> addPoints(int pointsToAdd) async {
    if (_user != null) {
      final dbHelper = DatabaseHelper();
      int newPoints = _user!['points'] + pointsToAdd;
      await dbHelper.updateUserPoints(_user!['id'], newPoints);
      _user!['points'] = newPoints;
      notifyListeners();
    }
  }
}
