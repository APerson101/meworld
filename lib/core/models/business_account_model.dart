import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meworld/core/models/ecommerce_model.dart';
import 'package:meworld/core/models/sportsfacilitymodel.dart';
import 'package:meworld/views/screens/account_sign_up.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';

part 'business_account_model.freezed.dart';
part 'business_account_model.g.dart';

@Freezed(genericArgumentFactories: true)
class BusinessAccountModel with _$BusinessAccountModel {
  const factory BusinessAccountModel({
    required BusinessTypes type,
    required List<BusinessDayAvailabilityModel> availability,
    required String name,
    required String description,
    required BusinessLocationModel location,
    required String moreInfo,
    required List<String> imageurls,
    required List<String> vidoeurls,
    required String businessID,
    BusinessEcommerceModel? store,
    List<SportsFacilityModel>? sportsFacilities,
  }) = _BusinessAccountModel;

  factory BusinessAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessAccountModelFromJson(json);
}

@Freezed(genericArgumentFactories: true)
class BusinessDayAvailabilityModel with _$BusinessDayAvailabilityModel {
  //day and list of available times
  // DaysOfWeek day;
  const factory BusinessDayAvailabilityModel(
      {required DaysOfWeek day,
      required List<RangedTime> times}) = _BusinessDayAvailabilityModel;
  factory BusinessDayAvailabilityModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessDayAvailabilityModelFromJson(json);
}

@freezed
class BusinessLocationModel with _$BusinessLocationModel {
  const factory BusinessLocationModel({
    required double longitude,
    required double latitude,
    required String location,
  }) = _BusinessLocationModel;

  factory BusinessLocationModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessLocationModelFromJson(json);
}

@freezed
class RangedTime with _$RangedTime {
  const factory RangedTime(
      {required DateTime startTime, required DateTime endTime}) = _RangedTime;

  factory RangedTime.fromJson(Map<String, dynamic> json) =>
      _$RangedTimeFromJson(json);
}
