import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../../../../core/helpers/architecture_helper/use_case.dart';
import '../entity/register_response_entity.dart';
import '../repository/auth_repository.dart';
import 'auth_param.dart';

class RegisterUseCase extends UseCase<RegisterResponseEntity, AuthParam> {
  final AuthRepository repo;

  RegisterUseCase(this.repo);

  @override
  TaskEither<Failure, RegisterResponseEntity> call(AuthParam params) {
    return repo.register(params);
  }
}
