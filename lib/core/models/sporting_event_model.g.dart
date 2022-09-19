// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sporting_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SportsEventModel _$$_SportsEventModelFromJson(Map<String, dynamic> json) =>
    _$_SportsEventModel(
      name: json['name'] as String,
      creatorID: json['creatorID'] as String,
      eventID: json['eventID'] as String,
      location: json['location'] as String,
      eventType: $enumDecode(_$SportingEventTypesEnumMap, json['eventType']),
      description: json['description'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$_SportsEventModelToJson(_$_SportsEventModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'creatorID': instance.creatorID,
      'eventID': instance.eventID,
      'location': instance.location,
      'eventType': _$SportingEventTypesEnumMap[instance.eventType]!,
      'description': instance.description,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
    };

const _$SportingEventTypesEnumMap = {
  SportingEventTypes.oneOff: 'oneOff',
  SportingEventTypes.tournament: 'tournament',
  SportingEventTypes.women: 'women',
};
