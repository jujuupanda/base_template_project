import '../../../../core/utils/map_sanitizer.dart';
import '../../domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.fullName,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json.str('full_name'),
    );
  }
  
  static const empty = ProfileModel(fullName: '');
}
