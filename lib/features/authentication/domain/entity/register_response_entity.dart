import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_entity.freezed.dart';

@freezed
abstract class RegisterResponseEntity with _$RegisterResponseEntity {
  const factory RegisterResponseEntity({
    required String id,
    required String username,
  }) = _RegisterResponseEntity;

  static const empty = RegisterResponseEntity(
    id: '',
    username: '',
  );
}
