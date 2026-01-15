import 'package:dio/dio.dart';

import '../../../features/auth/data/model/login_response_model.dart';
import '../../helpers/shared_preference/preference_helper.dart';
import '../../helpers/shared_preference/preference_keys.dart';
import 'api_consumer.dart';
import 'end_points.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  final ApiConsumer apiConsumer;

  RefreshTokenInterceptor(this.apiConsumer);

  bool _isRefreshing = false;

  final _requestsNeedRetry = <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    final authEndpoints = [EndPoints.login, EndPoints.refreshToken, EndPoints.register, EndPoints.forgotPassword];
    bool isAuthPath = authEndpoints.any((path) => err.requestOptions.path.contains(path));
    if (response != null && response.statusCode == 401 && !isAuthPath) {
      if (!_isRefreshing) {
        _isRefreshing = true;

        _requestsNeedRetry.add((
          options: response.requestOptions,
          handler: handler,
        ));

        final isRefreshSuccess = await _refreshToken();

        _isRefreshing = false;

        if (isRefreshSuccess) {
          for (var requestNeedRetry in _requestsNeedRetry) {
            final retry = await apiConsumer.client.fetch(
              requestNeedRetry.options,
            );
            requestNeedRetry.handler.resolve(retry);
          }
          _requestsNeedRetry.clear();
        } else {
          for (var request in _requestsNeedRetry) {
            request.handler.reject(err);
          }
          _requestsNeedRetry.clear();
        }
      } else {
        _requestsNeedRetry.add((
          options: response.requestOptions,
          handler: handler,
        ));
      }
    } else {
      return handler.next(err);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final response = await apiConsumer.post(
        EndPoints.refreshToken,
        body: {
          'refreshToken': PrefHelper.get(PrefKeys.refreshToken),
        },
      );

      // Handle both GlobalResponse format and direct data format
      final dynamic data = response.data;
      final Map<String, dynamic> jsonData;

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        jsonData = data['data'] as Map<String, dynamic>;
      } else if (data is Map<String, dynamic>) {
        jsonData = data;
      } else {
        return false;
      }

      final loginResponseModel = LoginResponseModel.fromJson(jsonData);
      await PrefHelper.save(
        PrefKeys.token,
        loginResponseModel.accessToken,
      );

      // Save new refresh token if provided
      if (loginResponseModel.refreshToken.isNotEmpty) {
        await PrefHelper.save(
          PrefKeys.refreshToken,
          loginResponseModel.refreshToken,
        );
      }

      return true;
    } catch (error) {
      return false;
    }
  }
}
