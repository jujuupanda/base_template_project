import 'package:fpdart/fpdart.dart';

import '../../error_handling/failures/failure.dart';

abstract class CanGet<T, P> {
  TaskEither<Failure, T> get(P param);
}

abstract class CanFetch<T, P> {
  TaskEither<Failure, List<T>> fetch(P param);
}

abstract class CanCreate<P> {
  TaskEither<Failure, Unit> create(P param);
}

abstract class CanUpdate<P> {
  TaskEither<Failure, Unit> update(P param);
}

abstract class CanDelete<P> {
  TaskEither<Failure, Unit> delete(P param);
}

abstract class CanPreview<T, P> {
  TaskEither<Failure, T> preview(P param);
}

abstract class InterfacesHelper<T, P> implements CanGet<T, P>, CanFetch<T, P>, CanCreate<P>, CanUpdate<P>, CanDelete<P> {}
