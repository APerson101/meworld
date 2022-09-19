// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecommerce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessEcommerceModel _$$_BusinessEcommerceModelFromJson(
        Map<String, dynamic> json) =>
    _$_BusinessEcommerceModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BusinessEcommerceModelToJson(
        _$_BusinessEcommerceModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$_ItemModel _$$_ItemModelFromJson(Map<String, dynamic> json) => _$_ItemModel(
      total: json['total'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      id: json['id'] as String,
      description: json['description'] as String,
      imageurls:
          (json['imageurls'] as List<dynamic>).map((e) => e as String).toList(),
      numberOfStars: (json['numberOfStars'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ItemModelToJson(_$_ItemModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'name': instance.name,
      'price': instance.price,
      'id': instance.id,
      'description': instance.description,
      'imageurls': instance.imageurls,
      'numberOfStars': instance.numberOfStars,
    };
