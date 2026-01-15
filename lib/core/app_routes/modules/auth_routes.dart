import 'package:go_router/go_router.dart';
import '../../../features/authentication/presentation/auth_screen/ui/login_screen.dart';
import '../../../features/authentication/presentation/auth_screen/ui/register_screen.dart';
import '../routes_constants.dart';

class AuthRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RouteConstants.login,
      name: RouteNames.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouteConstants.register,
      name: RouteNames.register,
      builder: (context, state) => const RegisterScreen(),
    ),
  ];
}
