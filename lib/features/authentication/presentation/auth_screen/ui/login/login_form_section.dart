import 'package:flutter/material.dart';

import 'login_controller.dart';

class LoginFormSection extends StatelessWidget {
  final LoginController controller;

  const LoginFormSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller.emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: controller.passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
