import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../error_handling/error_handler/error_handler.dart';
import '../../helpers/helper_functions/app_logger.dart';
import '../../helpers/shared_preference/preference_helper.dart';
import '../../helpers/shared_preference/preference_keys.dart';
import '../interceptors/app_interceptor_logger.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'refresh_token_interceptor.dart';

class DioConsumer implements ApiConsumer {
  static DioConsumer? _instance;
  final String? baseUrl;

  factory DioConsumer({String? baseUrl}) {
    _instance ??= DioConsumer._internal(Dio(), baseUrl: baseUrl);
    return _instance!;
  }

  DioConsumer._internal(this.client, {this.baseUrl}) {
    if (!kIsWeb) {
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }

    setDioOptions();
    client.interceptors.add(RefreshTokenInterceptor(this));
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final publicEndpoints = [
            EndPoints.login,
            EndPoints.register,
            EndPoints.forgotPassword,
          ];

          bool isPublic = publicEndpoints.any((path) => options.path.contains(path));

          if (!isPublic) {
            final token = PrefHelper.get(PrefKeys.token);
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          return handler.next(options);
        },
      ),
    );

    if (kDebugMode) {
      client.interceptors.add(
        AppInterceptorLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseMessage: true,
          ),
        ),
      );
      AppLogger.info('Bearer ${PrefHelper.get(PrefKeys.token)}');
    }
  }

  @override
  void setDioOptions() {
    client.options
      ..baseUrl = baseUrl ?? EndPoints.baseUrl
      ..headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      }
      ..sendTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..connectTimeout = const Duration(seconds: 20);
  }

  @override
  final Dio client;

  @override
  Future<Response> get<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(responseType: responseType),
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
        options: Options(responseType: responseType),
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> put<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(responseType: responseType),
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> delete<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
    ResponseType? responseType,
  }) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(responseType: responseType),
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  set client(_) {}
}
