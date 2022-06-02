import 'package:flutter/material.dart';
import 'package:splash_screen_login/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController controller;

  const CustomLoginButtonComponent({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                controller.auth().then((result) {
                  if (result) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Falha ao realizar o login'),
                      duration: Duration(seconds: 5),
                    ));
                  }
                });
              },
              child: const Text('Login')),
    );
  }
}
