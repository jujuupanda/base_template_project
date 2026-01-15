import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_scaffold.dart';
import 'widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: const ProfileBody());
  }
}
