import 'dart:convert';

class WalletTransactionModel {
  String id;
  String currency;
  double amount;
  String destination_ewallet_id;
  String source_ewallet_id;
  int created_at;
  String status;
  WalletTransactionModel({
    required this.id,
    required this.currency,
    required this.amount,
    required this.destination_ewallet_id,
    required this.source_ewallet_id,
    required this.created_at,
    required this.status,
  });

  WalletTransactionModel copyWith({
    String? id,
    String? currency,
    double? amount,
    String? destination_ewallet_id,
    String? source_ewallet_id,
    int? created_at,
    String? status,
  }) {
    return WalletTransactionModel(
      id: id ?? this.id,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      destination_ewallet_id:
          destination_ewallet_id ?? this.destination_ewallet_id,
      source_ewallet_id: source_ewallet_id ?? this.source_ewallet_id,
      created_at: created_at ?? this.created_at,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'currency': currency,
      'amount': amount,
      'destination_ewallet_id': destination_ewallet_id,
      'source_ewallet_id': source_ewallet_id,
      'created_at': created_at,
      'status': status,
    };
  }

  factory WalletTransactionModel.fromMap(Map<String, dynamic> map) {
    return WalletTransactionModel(
      id: map['id'] ?? '',
      currency: map['currency'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      destination_ewallet_id: map['destination_ewallet_id'] ?? '',
      source_ewallet_id: map['source_ewallet_id'] ?? '',
      created_at: map['created_at']?.toInt() ?? 0,
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletTransactionModel.fromJson(String source) =>
      WalletTransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WalletTransactionModel(id: $id, currency: $currency, amount: $amount, destination_ewallet_id: $destination_ewallet_id, source_ewallet_id: $source_ewallet_id, created_at: $created_at, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WalletTransactionModel &&
        other.id == id &&
        other.currency == currency &&
        other.amount == amount &&
        other.destination_ewallet_id == destination_ewallet_id &&
        other.source_ewallet_id == source_ewallet_id &&
        other.created_at == created_at &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        currency.hashCode ^
        amount.hashCode ^
        destination_ewallet_id.hashCode ^
        source_ewallet_id.hashCode ^
        created_at.hashCode ^
        status.hashCode;
  }
}
