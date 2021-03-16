import 'package:flutter/material.dart';

class AuthStatusProvider extends ChangeNotifier {
  bool authStatus = false;

  changeAuthStatus(gotStatus) {
    authStatus = gotStatus;
    notifyListeners();
  }
}
