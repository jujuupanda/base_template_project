import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_case/auth_param.dart';
import '../../logic/auth_bloc.dart';
import 'login_controller.dart';

mixin LoginActions {
  Future<void> onLoginPressed({
    required BuildContext context,
    required LoginController controller,
  }) async {
    final email = controller.emailController.text;
    final password = controller.passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showError(context, 'Email dan password tidak boleh kosong');
      return;
    }

    _showLoadingDialog(context);
    final param = AuthParam(
      email: email,
      password: password,
    );
    context.read<AuthBloc>().add(AuthEvent.loginRequest(param));
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }
}
