import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String fullName;

  const ProfileEntity({required this.fullName});

  @override
  List<Object?> get props => [fullName];

  ProfileEntity copyWith({
    String? fullName,
  }) {
    return ProfileEntity(
      fullName: fullName ?? this.fullName,
    );
  }

  const ProfileEntity.empty() : fullName = '';
}
