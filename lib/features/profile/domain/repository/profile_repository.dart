import '../../../../core/helpers/architecture_helper/interfaces_helper.dart';
import '../entity/profile_entity.dart';
import '../use_case/profile_param.dart';

abstract class ProfileRepository implements CanGet<ProfileEntity, ProfileParam>, CanUpdate<ProfileParam> {}
