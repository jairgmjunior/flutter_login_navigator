import 'package:flutter/material.dart';
import 'package:splash_screen_login/controllers/login_controller.dart';
import 'package:splash_screen_login/widget/custom_text_field_widget.dart';

import '../components/login/custom_login_button_component.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people,
                  size: MediaQuery.of(context).size.height * 0.2),
              CustomTextFieldWidget(
                  label: 'Usuário', onChanged: _controller.setLogin),
              CustomTextFieldWidget(
                  label: 'Senha',
                  onChanged: _controller.setSenha,
                  obscureText: true),
              const SizedBox(
                height: 15,
              ),
              CustomLoginButtonComponent(controller: _controller),
            ]),
      ),
    );
  }
}
