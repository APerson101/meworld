// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAccountModel _$$_UserAccountModelFromJson(Map<String, dynamic> json) =>
    _$_UserAccountModel(
      userID: json['userID'] as String,
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$UserInterestsEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_UserAccountModelToJson(_$_UserAccountModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'interests':
          instance.interests?.map((e) => _$UserInterestsEnumMap[e]!).toList(),
    };

const _$UserInterestsEnumMap = {
  UserInterests.sports: 'sports',
  UserInterests.health: 'health',
  UserInterests.gym: 'gym',
  UserInterests.shopping: 'shopping',
};
