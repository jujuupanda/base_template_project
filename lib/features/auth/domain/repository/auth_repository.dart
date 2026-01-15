import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../entity/login_response_entity.dart';
import '../entity/register_response_entity.dart';
import '../use_case/auth_param.dart';

abstract class AuthRepository
    implements CanLogin<LoginResponseEntity, AuthParam>, CanRegister<RegisterResponseEntity, AuthParam>, CanLogout<AuthParam> {}

abstract class CanLogin<T, P> {
  TaskEither<Failure, T> login(P param);
}

abstract class CanRegister<T, P> {
  TaskEither<Failure, T> register(P param);
}

abstract class CanLogout<P> {
  TaskEither<Failure, Unit> logout(P param);
}

abstract class CanForgetPassword<P> {
  TaskEither<Failure, Unit> forgetPassword(P param);
}

abstract class CanResetPassword<P> {
  TaskEither<Failure, Unit> resetPassword(P param);
}

abstract class CanVerifyOtp<P> {
  TaskEither<Failure, Unit> verifyOtp(P param);
}
