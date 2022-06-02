import 'package:flutter/cupertino.dart';
import 'package:splash_screen_login/services/prefs_service.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value.toLowerCase();

  String? _senha;
  setSenha(String value) => _senha = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;
    if (_login == 'admin' && _senha == '123') {
      PrefsService.save(_login!);
      return true;
    } else {
      return false;
    }
  }
}
