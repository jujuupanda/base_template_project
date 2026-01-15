import 'package:equatable/equatable.dart';

class AuthParam extends Equatable {
  final String? email;
  final String? password;
  final String? name;

  const AuthParam({
    this.email,
    this.password,
    this.name,
  });

  @override
  List<Object?> get props => [email, password, name];
}
