import 'package:flutter/material.dart';

import 'login_controller.dart';
import 'login_form_section.dart';

mixin LoginWidgets {
  LoginFormSection form(LoginController controller) {
    return LoginFormSection(controller: controller);
  }

  Widget button(VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Login'),
    );
  }
}
