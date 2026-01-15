import 'package:fpdart/fpdart.dart';

import '../../../../../core/api/api_request_helpers/api_consumer.dart';
import '../../../../../core/api/api_request_helpers/api_handler.dart';
import '../../../../../core/api/api_request_helpers/end_points.dart';
import '../../../../../core/error_handling/failures/failure.dart';
import '../../../../../core/helpers/architecture_helper/interfaces_helper.dart';
import '../../../domain/use_case/profile_param.dart';
import '../../model/profile_model.dart';

abstract class ProfileRemoteDataSource implements CanGet<ProfileModel, ProfileParam>, CanUpdate<ProfileParam> {}

class ProfileRemoteDataSourceImpl with ApiHandler implements ProfileRemoteDataSource {
  final ApiConsumer api;

  ProfileRemoteDataSourceImpl({required this.api});

  @override
  TaskEither<Failure, ProfileModel> get(ProfileParam param) {
    return result<ProfileModel>(
      call: () => api.get(EndPoints.profile),
      fromJsonT: (json) => ProfileModel.fromJson(json),
      defaultValue: ProfileModel.empty,
    );
  }

  @override
  TaskEither<Failure, Unit> update(ProfileParam param) {
    return unitResult(call: () => api.put(EndPoints.profile));
  }
}
