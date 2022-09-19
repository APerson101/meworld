import 'package:freezed_annotation/freezed_annotation.dart';

part 'sporting_event_model.freezed.dart';
part 'sporting_event_model.g.dart';

@freezed
class SportsEventModel with _$SportsEventModel {
  const factory SportsEventModel({
    required String name,
    required String creatorID,
    required String eventID,
    required String location,
    required SportingEventTypes eventType,
    required String description,
    required DateTime startTime,
    required DateTime endTime,
  }) = _SportsEventModel;

  factory SportsEventModel.fromJson(Map<String, Object?> json) =>
      _$SportsEventModelFromJson(json);
}

enum SportingEventTypes { oneOff, tournament, women }
