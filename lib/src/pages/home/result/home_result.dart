import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_result.freezed.dart';

@freezed
class HomeResult with _$HomeResult {
  factory HomeResult.success(List data) = Success;
  factory HomeResult.error(String message) = Error;
}
