import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/views/screens/business%20forms/sports_center_form_view.dart';

enum BookingStatus { canceled, awaitingConfirmation, passed, awaitingTime }

class BookingsModel {
  String businessID;
  String userID;
  List<RangedTime> time;
  BookingStatus bookingStatus;
  String bookingID;
  SportsFacilities? sportsFacility;
  BookingsModel({
    required this.businessID,
    required this.userID,
    required this.time,
    required this.bookingStatus,
    required this.bookingID,
    this.sportsFacility,
  });

  BookingsModel copyWith({
    String? businessID,
    String? userID,
    List<RangedTime>? time,
    BookingStatus? bookingStatus,
    String? bookingID,
    SportsFacilities? sportsFacility,
  }) {
    return BookingsModel(
      businessID: businessID ?? this.businessID,
      userID: userID ?? this.userID,
      time: time ?? this.time,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      bookingID: bookingID ?? this.bookingID,
      sportsFacility: sportsFacility ?? this.sportsFacility,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'businessID': businessID,
      'userID': userID,
      'time': time.map((x) => x.toJson()).toList(),
      'bookingStatus': describeEnum(bookingStatus),
      'bookingID': bookingID,
      'sportsFacility':
          sportsFacility != null ? describeEnum(sportsFacility!) : null,
    };
  }

  factory BookingsModel.fromMap(Map<String, dynamic> map) {
    return BookingsModel(
      businessID: map['businessID'] ?? '',
      userID: map['userID'] ?? '',
      time: List<RangedTime>.from(
          map['time']?.map((x) => RangedTime.fromJson(x))),
      bookingStatus: BookingStatus.values
          .firstWhere((va) => describeEnum(va) == map['bookingStatus']),
      bookingID: map['bookingID'] ?? '',
      sportsFacility: map['sportsFacility'] != null
          ? SportsFacilities.values
              .firstWhere((va) => describeEnum(va) == map['sportsFacility'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingsModel.fromJson(String source) =>
      BookingsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookingsModel(businessID: $businessID, userID: $userID, time: $time, bookingStatus: $bookingStatus, bookingID: $bookingID, sportsFacility: $sportsFacility)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingsModel &&
        other.businessID == businessID &&
        other.userID == userID &&
        listEquals(other.time, time) &&
        other.bookingStatus == bookingStatus &&
        other.bookingID == bookingID &&
        other.sportsFacility == sportsFacility;
  }

  @override
  int get hashCode {
    return businessID.hashCode ^
        userID.hashCode ^
        time.hashCode ^
        bookingStatus.hashCode ^
        bookingID.hashCode ^
        sportsFacility.hashCode;
  }
}
