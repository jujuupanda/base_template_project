import 'package:fpdart/fpdart.dart';

import '../../error_handling/failures/failure.dart';

abstract class UseCase<ReturnType, Params> {
  TaskEither<Failures, ReturnType> call(Params params);
}

abstract class StreamUseCase<ReturnType, Params> {
  Stream<Either<Failures, ReturnType>> call(Params params);
}
