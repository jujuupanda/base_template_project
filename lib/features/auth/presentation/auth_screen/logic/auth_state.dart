part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.success() = _Success;

  const factory AuthState.error(String message) = _Error;

  const factory AuthState.authenticated({
    required String message,
    required String user,
}) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;
}
