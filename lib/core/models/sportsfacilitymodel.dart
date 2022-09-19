import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../views/screens/business forms/sports_center_form_view.dart';

class SportsFacilityModel {
  String name;
  double price;
  SportsPaymentOptions paymentType;
  SportsFacilityModel({
    required this.name,
    required this.price,
    required this.paymentType,
  });

  SportsFacilityModel copyWith({
    String? name,
    double? price,
    SportsPaymentOptions? paymentType,
  }) {
    return SportsFacilityModel(
      name: name ?? this.name,
      price: price ?? this.price,
      paymentType: paymentType ?? this.paymentType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'paymentType': describeEnum(paymentType)
    };
  }

  factory SportsFacilityModel.fromMap(Map<String, dynamic> map) {
    return SportsFacilityModel(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      paymentType: SportsPaymentOptions.values
          .firstWhere((element) => describeEnum(element) == map['paymentType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SportsFacilityModel.fromJson(String source) =>
      SportsFacilityModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SportsFacilityModel(name: $name, price: $price, paymentType: $paymentType)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SportsFacilityModel &&
        other.name == name &&
        other.price == price &&
        other.paymentType == paymentType;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ paymentType.hashCode;
}
