import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'modules/auth_routes.dart';
import 'modules/dashboard_routes.dart';
import 'routes_constants.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteConstants.login,
    debugLogDiagnostics: true,
    routes: [
      DashboardRoutes.route,

      ...AuthRoutes.routes,
    ],

    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page Not Found')),
    ),
  );
}
