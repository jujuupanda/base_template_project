import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handling/failures/failure.dart';
import '../../../../core/helpers/architecture_helper/use_case.dart';
import '../entity/profile_entity.dart';
import '../repository/profile_repository.dart';
import 'profile_param.dart';

class GetProfileUseCase extends UseCase<ProfileEntity, ProfileParam> {
  final ProfileRepository repo;

  GetProfileUseCase(this.repo);

  @override
  TaskEither<Failure, ProfileEntity> call(ProfileParam params) {
    return repo.get(params);
  }
}
