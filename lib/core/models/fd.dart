// // GENERATED CODE - DO NOT MODIFY BY HAND

// // ignore_for_file: non_constant_identifier_names

// part of 'business_account_model.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// _$_BusinessAccountModel _$$_BusinessAccountModelFromJson(
//         Map<String, dynamic> json) =>
//     _$_BusinessAccountModel(
//       type: $enumDecode(_$BusinessTypesEnumMap, json['type']),
//       availability: (json['availability'] as List<dynamic>)
//           .map((e) =>
//               BusinessDayAvailabilityModel.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       name: json['name'] as String,
//       description: json['description'] as String,
//       location: BusinessLocationModel.fromJson(
//           json['location'] as Map<String, dynamic>),
//       moreInfo: json['moreInfo'] as String,
//       imageurls:
//           (json['imageurls'] as List<dynamic>).map((e) => e as String).toList(),
//       vidoeurls:
//           (json['vidoeurls'] as List<dynamic>).map((e) => e as String).toList(),
//       businessID: json['businessID'] as String,
//       store: json['store'] == null
//           ? null
//           : BusinessEcommerceModel.fromJson(
//               json['store'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$$_BusinessAccountModelToJson(
//         _$_BusinessAccountModel instance) =>
//     <String, dynamic>{
//       'type': _$BusinessTypesEnumMap[instance.type]!,
//       'availability': [...instance.availability.map((e) => e.toJson())],
//       'name': instance.name,
//       'description': instance.description,
//       'location': instance.location.toJson(),
//       'moreInfo': instance.moreInfo,
//       'imageurls': instance.imageurls,
//       'vidoeurls': instance.vidoeurls,
//       'businessID': instance.businessID,
//       'store': instance.store?.toJson(),
//     };

// const _$BusinessTypesEnumMap = {
//   BusinessTypes.gym: 'gym',
//   BusinessTypes.consultant: 'consultant',
//   BusinessTypes.sportscenter: 'sportscenter',
//   BusinessTypes.pharmacy: 'pharmacy',
// };

// _$_BusinessDayAvailabilityModel _$$_BusinessDayAvailabilityModelFromJson(
//         Map<String, dynamic> json) =>
//     _$_BusinessDayAvailabilityModel(
//       day: $enumDecode(_$DaysOfWeekEnumMap, json['day']),
//       times: (json['times'] as List<dynamic>)
//           .map((e) => RangedTime.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );

// Map<String, dynamic> _$$_BusinessDayAvailabilityModelToJson(
//         _$_BusinessDayAvailabilityModel instance) =>
//     <String, dynamic>{
//       'day': _$DaysOfWeekEnumMap[instance.day]!,
//       'times': [...instance.times.map((e) => e.toJson())],
//     };

// const _$DaysOfWeekEnumMap = {
//   DaysOfWeek.sunday: 'sunday',
//   DaysOfWeek.monday: 'monday',
//   DaysOfWeek.tuesday: 'tuesday',
//   DaysOfWeek.wednesday: 'wednesday',
//   DaysOfWeek.thurday: 'thurday',
//   DaysOfWeek.friday: 'friday',
//   DaysOfWeek.saturday: 'saturday',
// };

// _$_BusinessLocationModel _$$_BusinessLocationModelFromJson(
//         Map<String, dynamic> json) =>
//     _$_BusinessLocationModel(
//       longitude: (json['longitude'] as num).toDouble(),
//       latitude: (json['latitude'] as num).toDouble(),
//       location: json['location'] as String,
//     );

// Map<String, dynamic> _$$_BusinessLocationModelToJson(
//         _$_BusinessLocationModel instance) =>
//     <String, dynamic>{
//       'longitude': instance.longitude,
//       'latitude': instance.latitude,
//       'location': instance.location,
//     };

// _$_RangedTime _$$_RangedTimeFromJson(Map<String, dynamic> json) =>
//     _$_RangedTime(
//       startTime: DateTime.parse(json['startTime'] as String),
//       endTime: DateTime.parse(json['endTime'] as String),
//     );

// Map<String, dynamic> _$$_RangedTimeToJson(_$_RangedTime instance) =>
//     <String, dynamic>{
//       'startTime': instance.startTime.toIso8601String(),
//       'endTime': instance.endTime.toIso8601String(),
//     };
