import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../domain/use_case/auth_param.dart';
import '../../../domain/use_case/login_use_case.dart';
import '../../../domain/use_case/logout_use_case.dart';
import '../../../domain/use_case/register_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase login;
  final RegisterUseCase register;
  final LogoutUseCase logout;

  AuthBloc({
    required this.login,
    required this.register,
    required this.logout,
  }) : super(const AuthState.initial()) {
    on<_LoginRequest>(_login, transformer: droppable());
    on<_RegisterRequest>(_register, transformer: droppable());
    on<_LogoutRequest>(_logout, transformer: droppable());
  }

  void _login(_LoginRequest event, Emitter<AuthState> emit) async {
    emit(const AuthState.authenticating());

    final result = await login.call(event.param).run();
    result.fold(
      (l) => emit(AuthState.authFailure(l.message)),
      (r) => emit(AuthState.authenticated()),
    );
  }

  void _register(_RegisterRequest event, Emitter<AuthState> emit) async {
    emit(const AuthState.authenticating());

    final result = await register.call(event.param).run();
    result.fold(
      (l) => emit(AuthState.authFailure(l.message)),
      (r) => emit(AuthState.authenticated()),
    );
  }

  void _logout(_LogoutRequest event, Emitter<AuthState> emit) async {
    emit(const AuthState.loggingOut());
    final result = await logout.call(AuthParam()).run();
    result.fold(
      (l) => emit(AuthState.logoutFailure(l.message)),
      (r) => emit(AuthState.unauthenticated()),
    );
  }
}
