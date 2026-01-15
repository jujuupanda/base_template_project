part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.authenticating() = _Authenticating;

  const factory AuthState.authenticated() = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.authFailure(String message) = _AuthFailure;

  const factory AuthState.loggingOut() = _LoggingOut;

  const factory AuthState.logoutFailure(String message) = _LogoutFailure;
}
