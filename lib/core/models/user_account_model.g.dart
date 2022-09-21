// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAccountModel _$$_UserAccountModelFromJson(Map<String, dynamic> json) =>
    _$_UserAccountModel(
      userID: json['userID'] as String,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => ContactsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$UserInterestsEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_UserAccountModelToJson(_$_UserAccountModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'contacts': instance.contacts == null
          ? null
          : [...instance.contacts!.map((e) => e.toJson())],
      'interests':
          instance.interests?.map((e) => _$UserInterestsEnumMap[e]!).toList(),
    };

const _$UserInterestsEnumMap = {
  UserInterests.sports: 'sports',
  UserInterests.health: 'health',
  UserInterests.gym: 'gym',
  UserInterests.shopping: 'shopping',
};

_$_ContactsModel _$$_ContactsModelFromJson(Map<String, dynamic> json) =>
    _$_ContactsModel(
      name: json['name'] as String,
      eWalletID: json['eWalletID'] as String,
    );

Map<String, dynamic> _$$_ContactsModelToJson(_$_ContactsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'eWalletID': instance.eWalletID,
    };
