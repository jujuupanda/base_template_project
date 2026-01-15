import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../../domain/entity/login_response_entity.dart';
import '../../domain/entity/register_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_case/auth_param.dart';
import '../data_source/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource rds;

  const AuthRepositoryImpl({required this.rds});

  @override
  TaskEither<Failure, LoginResponseEntity> login(AuthParam param) {
    return rds.login(param).map((res) => res.toEntity());
  }

  @override
  TaskEither<Failure, RegisterResponseEntity> register(AuthParam param) {
    return rds.register(param).map((res) => res.toEntity());
  }

  @override
  TaskEither<Failure, Unit> logout(AuthParam param) {
    return rds.logout(param).map((res) => unit);
  }
}
