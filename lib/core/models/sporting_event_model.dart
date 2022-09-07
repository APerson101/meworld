import 'dart:convert';

import 'package:flutter/foundation.dart';

class SportsEvent {
  String name;
  String location;
  SportingEventTypes eventType;
  String description;
  DateTime startTime;
  DateTime endTime;
  SportsEvent({
    required this.name,
    required this.location,
    required this.eventType,
    required this.description,
    required this.startTime,
    required this.endTime,
  });

  SportsEvent copyWith({
    String? name,
    String? location,
    SportingEventTypes? eventType,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return SportsEvent(
      name: name ?? this.name,
      location: location ?? this.location,
      eventType: eventType ?? this.eventType,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'eventType': describeEnum(eventType),
      'description': description,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
    };
  }

  factory SportsEvent.fromMap(Map<String, dynamic> map) {
    return SportsEvent(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      eventType: SportingEventTypes.values
          .firstWhere((element) => describeEnum(element) == map['eventType']),
      description: map['description'] ?? '',
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime']),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SportsEvent.fromJson(String source) =>
      SportsEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SportsEvent(name: $name, location: $location, eventType: $eventType, description: $description, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SportsEvent &&
        other.name == name &&
        other.location == location &&
        other.eventType == eventType &&
        other.description == description &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        eventType.hashCode ^
        description.hashCode ^
        startTime.hashCode ^
        endTime.hashCode;
  }
}

enum SportingEventTypes { oneOff, tournament, women }
