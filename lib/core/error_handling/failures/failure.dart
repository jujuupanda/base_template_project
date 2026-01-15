import 'package:equatable/equatable.dart';

import '../../helpers/helper_functions/app_logger.dart';
import '../error_handler/error_handler.dart';

part 'local_failure.dart';

part 'mapping_failure.dart';

part 'server_failure.dart';

abstract class Failures<T> extends Equatable implements Exception {
  const Failures({
    required this.message,
    this.statusCode,
    this.apiStatus,
    this.validationErrors,
  });

  /// This is user friendly message
  final String message;

  /// For Api
  final int? statusCode;
  final String? apiStatus;
  final T? validationErrors;
}

typedef Failure = Failures<dynamic>;
