import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../domain/use_case/auth_param.dart';
import '../../../domain/use_case/login_use_case.dart';
import '../../../domain/use_case/register_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase login;
  final RegisterUseCase register;

  AuthBloc({
    required this.login,
    required this.register,
  }) : super(const AuthState.initial()) {
    on<_LoginRequest>(_login, transformer: droppable());
    on<_RegisterRequest>(_register, transformer: droppable());
  }

  void _login(_LoginRequest event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await login.call(event.param).run();
    result.fold(
      (l) => emit(AuthState.error('gagal login')),
      (r) => emit(
        AuthState.authenticated(
          message: r.accessToken,
          user: r.refreshToken,
        ),
      ),
    );
  }

  void _register(_RegisterRequest event, Emitter<AuthState> emit) {}
}
