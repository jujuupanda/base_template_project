import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../../../../core/helpers/architecture_helper/use_case.dart';
import '../repository/auth_repository.dart';
import 'auth_param.dart';

class LogoutUseCase extends UseCase<Unit, AuthParam> {
  final AuthRepository repo;

  LogoutUseCase(this.repo);

  @override
  TaskEither<Failure, Unit> call(AuthParam params) {
    return repo.logout(params);
  }
}
