import 'package:get_it/get_it.dart';
import 'modules/core_module.dart';
import 'modules/auth_module.dart';

// Global Service Locator instance
final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // 1. Core Module (Network, Local Storage, External libs)
  await CoreModule.init();

  // 2. Feature Modules
  // Setiap fitur mendaftarkan dependensinya sendiri
  AuthModule.init();
  
  // Tambahkan modul fitur lain di sini nanti
  // ProductModule.init();
}
