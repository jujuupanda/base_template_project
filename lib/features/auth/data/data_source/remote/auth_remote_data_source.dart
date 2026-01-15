import 'package:fpdart/fpdart.dart';

import '../../../../../core/api/api_request_helpers/api_consumer.dart';
import '../../../../../core/api/api_request_helpers/api_handler.dart';
import '../../../../../core/api/api_request_helpers/end_points.dart';
import '../../../../../core/error_handling/failures/failure.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../domain/use_case/auth_param.dart';
import '../../model/login_response_model.dart';
import '../../model/register_response_model.dart';

abstract class AuthRemoteDataSource
    implements CanLogin<LoginResponseModel, AuthParam>, CanRegister<RegisterResponseModel, AuthParam>, CanLogout<AuthParam> {}

class AuthRemoteDataSourceImpl with ApiHandler implements AuthRemoteDataSource {
  final ApiConsumer api;

  const AuthRemoteDataSourceImpl({required this.api});

  @override
  TaskEither<Failure, LoginResponseModel> login(AuthParam param) {
    return result<LoginResponseModel>(
      call: () => api.post(
        EndPoints.login,
        body: {
          'userName': param.email,
          'userPassword': param.password,
        },
      ),
      fromJsonT: (json) => LoginResponseModel.fromJson(json),
      defaultValue: LoginResponseModel.empty,
    );
  }

  @override
  TaskEither<Failure, RegisterResponseModel> register(AuthParam param) {
    return result<RegisterResponseModel>(
      call: () => api.get(EndPoints.register),
      fromJsonT: (json) => RegisterResponseModel.fromJson(json),
      defaultValue: RegisterResponseModel.empty,
    );
  }

  @override
  TaskEither<Failure, Unit> logout(AuthParam param) {
    return fakeUnitResult();
  }
}
