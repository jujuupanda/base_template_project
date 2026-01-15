import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes_constants.dart';

// --- Placeholder Screens ---
class HomeScreen extends StatelessWidget { const HomeScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Home Tab'))); }
class ProfileScreen extends StatelessWidget { const ProfileScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Profile Tab'))); }
class SettingsScreen extends StatelessWidget { const SettingsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Settings Tab'))); }

// --- Wrapper untuk Bottom Navigation Bar ---
class DashboardWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardWrapper({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when switching branches is to support
      // navigating to the initial location when tapping the item that is
      // already active.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class DashboardRoutes {
  // Kita gunakan StatefulShellRoute agar state halaman terjaga saat pindah tab
  static final RouteBase route = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return DashboardWrapper(navigationShell: navigationShell);
    },
    branches: [
      // BRANCH 0: Home
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RouteConstants.home,
            name: RouteNames.home,
            builder: (context, state) => const HomeScreen(),
            routes: [
              // Sub-routes untuk Home bisa ditaruh di sini
              // Contoh: GoRoute(path: 'details', ...),
            ],
          ),
        ],
      ),

      // BRANCH 1: Profile
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RouteConstants.profile,
            name: RouteNames.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

      // BRANCH 2: Settings
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RouteConstants.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}
