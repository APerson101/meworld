import 'package:freezed_annotation/freezed_annotation.dart';

part 'ecommerce_model.freezed.dart';
part 'ecommerce_model.g.dart';

@freezed
class BusinessEcommerceModel with _$BusinessEcommerceModel {
  const factory BusinessEcommerceModel({required List<ItemModel> items}) =
      _BusinessEcommerceModel;

  factory BusinessEcommerceModel.fromJson(Map<String, Object?> json) =>
      _$BusinessEcommerceModelFromJson(json);
}

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel(
      {required int total,
      required String name,
      required double price,
      required String id,
      required String description,
      required List<String> imageurls,
      double? numberOfStars}) = _ItemModel;

  factory ItemModel.fromJson(Map<String, Object?> json) =>
      _$ItemModelFromJson(json);
}
