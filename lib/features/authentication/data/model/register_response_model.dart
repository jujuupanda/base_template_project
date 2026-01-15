import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/register_response_entity.dart';

part 'register_response_model.freezed.dart';

part 'register_response_model.g.dart';

@freezed
abstract class RegisterResponseModel with _$RegisterResponseModel {
  const RegisterResponseModel._();

  const factory RegisterResponseModel({
    required String id,
    required String username,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);

  RegisterResponseEntity toEntity() {
    return RegisterResponseEntity(
      id: id,
      username: username,
    );
  }

  static const empty = RegisterResponseModel(
    id: '',
    username: '',
  );
}
