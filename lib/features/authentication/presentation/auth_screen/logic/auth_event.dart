part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {

  const factory AuthEvent.loginRequest(AuthParam param) = _LoginRequest;

  const factory AuthEvent.registerRequest(AuthParam param) = _RegisterRequest;

  const factory AuthEvent.logoutRequest() = _LogoutRequest;
}
