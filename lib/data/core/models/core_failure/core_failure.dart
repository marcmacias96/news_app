import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_failure.freezed.dart';

@freezed
class CoreFailure with _$CoreFailure {
  const factory CoreFailure.unauthenticated() = Unauthenticated;
  const factory CoreFailure.unexpected() = Unexpected;
  const factory CoreFailure.serverError() = ServerError;
  const factory CoreFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}
