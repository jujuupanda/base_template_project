import 'package:flutter/material.dart';

import 'features/authentication/presentation/auth_screen/ui/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
