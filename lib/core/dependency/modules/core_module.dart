import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api_request_helpers/api_consumer.dart';
import '../../api/api_request_helpers/dio_consumer.dart';
import '../injection_container.dart';

class CoreModule {
  static Future<void> init() async {
    // --- External ---
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);

    // --- Core ---
    // ApiConsumer (Dio)
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer());

    // Network Info, dll bisa ditambahkan di sini
  }
}
