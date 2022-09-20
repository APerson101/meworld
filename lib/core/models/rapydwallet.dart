import 'dart:convert';

import 'package:hive/hive.dart';

part 'rapydwallet.g.dart';

@HiveType(typeId: 0)
class Wallet {
  @HiveField(0)
  String phone_number;
  @HiveField(1)
  String email;
  @HiveField(2)
  String first_name;
  @HiveField(3)
  String last_name;
  @HiveField(4)
  String id;
  Wallet({
    required this.phone_number,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.id,
  });

  Wallet copyWith({
    String? phone_number,
    String? email,
    String? first_name,
    String? last_name,
    String? id,
  }) {
    return Wallet(
      phone_number: phone_number ?? this.phone_number,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone_number': phone_number,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'id': id,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      phone_number: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Wallet(phone_number: $phone_number, email: $email, first_name: $first_name, last_name: $last_name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wallet &&
        other.phone_number == phone_number &&
        other.email == email &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.id == id;
  }

  @override
  int get hashCode {
    return phone_number.hashCode ^
        email.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        id.hashCode;
  }
}

class WalletBalanceModel {
  String currency;
  double balance;
  WalletBalanceModel({
    required this.currency,
    required this.balance,
  });

  WalletBalanceModel copyWith({
    String? currency,
    double? balance,
  }) {
    return WalletBalanceModel(
      currency: currency ?? this.currency,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currency': currency,
      'balance': balance,
    };
  }

  factory WalletBalanceModel.fromMap(Map<String, dynamic> map) {
    return WalletBalanceModel(
      currency: map['currency'] ?? '',
      balance: map['balance']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletBalanceModel.fromJson(String source) =>
      WalletBalanceModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WalletBalanceModel(currency: $currency, balance: $balance)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WalletBalanceModel &&
        other.currency == currency &&
        other.balance == balance;
  }

  @override
  int get hashCode => currency.hashCode ^ balance.hashCode;
}
