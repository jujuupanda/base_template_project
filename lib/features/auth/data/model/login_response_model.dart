import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/login_response_entity.dart';

part 'login_response_model.freezed.dart';

part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._();

  const factory LoginResponseModel({
    required String accessToken,
    required String refreshToken,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  static const empty = LoginResponseModel(
    accessToken: '',
    refreshToken: '',
  );
}
