
import 'package:flutter/foundation.dart';
import '../config/app_config.dart';

class SessionService extends ChangeNotifier {
  DateTime? _lastLoginTime;
  bool _isLoggedIn = false;

  bool get isLoggedIn {
    if (_lastLoginTime != null) {
      if (DateTime.now().difference(_lastLoginTime!) > AppConfig.sessionTimeout) {
        logout();
        return false;
      }
      return _isLoggedIn;
    }
    return false;
  }

  void login() {
    _isLoggedIn = true;
    _lastLoginTime = DateTime.now();
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _lastLoginTime = null;
    notifyListeners();
  }
}