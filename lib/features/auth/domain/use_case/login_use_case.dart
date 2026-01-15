import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../../../../core/helpers/architecture_helper/use_case.dart';
import '../entity/login_response_entity.dart';
import '../repository/auth_repository.dart';
import 'auth_param.dart';

class LoginUseCase extends UseCase<LoginResponseEntity, AuthParam> {
  final AuthRepository repo;

  LoginUseCase(this.repo);

  @override
  TaskEither<Failure, LoginResponseEntity> call(AuthParam params) {
    return repo.login(params);
  }
}
