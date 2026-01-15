part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.loginRequest(AuthParam param) = _LoginRequest;
  const factory AuthEvent.registerRequest(AuthParam param) = _RegisterRequest;
}
