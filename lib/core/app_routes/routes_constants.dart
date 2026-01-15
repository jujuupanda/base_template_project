class RouteConstants {
  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Dashboard (Shell Route)
  static const String home = '/';
  static const String profile = '/profile';
  static const String settings = '/settings';

  // Product
  static const String productList = '/products';
  static const String productDetail = 'detail'; // Sub-route tidak perlu slash di depan
}

class RouteNames {
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String productDetail = 'productDetail';
}
