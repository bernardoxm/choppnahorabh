import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  bool _isNewClient = false;

  bool get isNewClient => _isNewClient;

  void setNewClient(bool value) {
    _isNewClient = value;
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }
}
