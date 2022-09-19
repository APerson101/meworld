// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ecommerce_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusinessEcommerceModel _$BusinessEcommerceModelFromJson(
    Map<String, dynamic> json) {
  return _BusinessEcommerceModel.fromJson(json);
}

/// @nodoc
mixin _$BusinessEcommerceModel {
  List<ItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessEcommerceModelCopyWith<BusinessEcommerceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessEcommerceModelCopyWith<$Res> {
  factory $BusinessEcommerceModelCopyWith(BusinessEcommerceModel value,
          $Res Function(BusinessEcommerceModel) then) =
      _$BusinessEcommerceModelCopyWithImpl<$Res>;
  $Res call({List<ItemModel> items});
}

/// @nodoc
class _$BusinessEcommerceModelCopyWithImpl<$Res>
    implements $BusinessEcommerceModelCopyWith<$Res> {
  _$BusinessEcommerceModelCopyWithImpl(this._value, this._then);

  final BusinessEcommerceModel _value;
  // ignore: unused_field
  final $Res Function(BusinessEcommerceModel) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_BusinessEcommerceModelCopyWith<$Res>
    implements $BusinessEcommerceModelCopyWith<$Res> {
  factory _$$_BusinessEcommerceModelCopyWith(_$_BusinessEcommerceModel value,
          $Res Function(_$_BusinessEcommerceModel) then) =
      __$$_BusinessEcommerceModelCopyWithImpl<$Res>;
  @override
  $Res call({List<ItemModel> items});
}

/// @nodoc
class __$$_BusinessEcommerceModelCopyWithImpl<$Res>
    extends _$BusinessEcommerceModelCopyWithImpl<$Res>
    implements _$$_BusinessEcommerceModelCopyWith<$Res> {
  __$$_BusinessEcommerceModelCopyWithImpl(_$_BusinessEcommerceModel _value,
      $Res Function(_$_BusinessEcommerceModel) _then)
      : super(_value, (v) => _then(v as _$_BusinessEcommerceModel));

  @override
  _$_BusinessEcommerceModel get _value =>
      super._value as _$_BusinessEcommerceModel;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_BusinessEcommerceModel(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessEcommerceModel implements _BusinessEcommerceModel {
  const _$_BusinessEcommerceModel({required final List<ItemModel> items})
      : _items = items;

  factory _$_BusinessEcommerceModel.fromJson(Map<String, dynamic> json) =>
      _$$_BusinessEcommerceModelFromJson(json);

  final List<ItemModel> _items;
  @override
  List<ItemModel> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'BusinessEcommerceModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessEcommerceModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_BusinessEcommerceModelCopyWith<_$_BusinessEcommerceModel> get copyWith =>
      __$$_BusinessEcommerceModelCopyWithImpl<_$_BusinessEcommerceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessEcommerceModelToJson(
      this,
    );
  }
}

abstract class _BusinessEcommerceModel implements BusinessEcommerceModel {
  const factory _BusinessEcommerceModel(
      {required final List<ItemModel> items}) = _$_BusinessEcommerceModel;

  factory _BusinessEcommerceModel.fromJson(Map<String, dynamic> json) =
      _$_BusinessEcommerceModel.fromJson;

  @override
  List<ItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessEcommerceModelCopyWith<_$_BusinessEcommerceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
mixin _$ItemModel {
  int get total => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get imageurls => throw _privateConstructorUsedError;
  double? get numberOfStars => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res>;
  $Res call(
      {int total,
      String name,
      double price,
      String id,
      String description,
      List<String> imageurls,
      double? numberOfStars});
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res> implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

  final ItemModel _value;
  // ignore: unused_field
  final $Res Function(ItemModel) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? id = freezed,
    Object? description = freezed,
    Object? imageurls = freezed,
    Object? numberOfStars = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageurls: imageurls == freezed
          ? _value.imageurls
          : imageurls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfStars: numberOfStars == freezed
          ? _value.numberOfStars
          : numberOfStars // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemModelCopyWith<$Res> implements $ItemModelCopyWith<$Res> {
  factory _$$_ItemModelCopyWith(
          _$_ItemModel value, $Res Function(_$_ItemModel) then) =
      __$$_ItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int total,
      String name,
      double price,
      String id,
      String description,
      List<String> imageurls,
      double? numberOfStars});
}

/// @nodoc
class __$$_ItemModelCopyWithImpl<$Res> extends _$ItemModelCopyWithImpl<$Res>
    implements _$$_ItemModelCopyWith<$Res> {
  __$$_ItemModelCopyWithImpl(
      _$_ItemModel _value, $Res Function(_$_ItemModel) _then)
      : super(_value, (v) => _then(v as _$_ItemModel));

  @override
  _$_ItemModel get _value => super._value as _$_ItemModel;

  @override
  $Res call({
    Object? total = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? id = freezed,
    Object? description = freezed,
    Object? imageurls = freezed,
    Object? numberOfStars = freezed,
  }) {
    return _then(_$_ItemModel(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageurls: imageurls == freezed
          ? _value._imageurls
          : imageurls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfStars: numberOfStars == freezed
          ? _value.numberOfStars
          : numberOfStars // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemModel implements _ItemModel {
  const _$_ItemModel(
      {required this.total,
      required this.name,
      required this.price,
      required this.id,
      required this.description,
      required final List<String> imageurls,
      this.numberOfStars})
      : _imageurls = imageurls;

  factory _$_ItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ItemModelFromJson(json);

  @override
  final int total;
  @override
  final String name;
  @override
  final double price;
  @override
  final String id;
  @override
  final String description;
  final List<String> _imageurls;
  @override
  List<String> get imageurls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageurls);
  }

  @override
  final double? numberOfStars;

  @override
  String toString() {
    return 'ItemModel(total: $total, name: $name, price: $price, id: $id, description: $description, imageurls: $imageurls, numberOfStars: $numberOfStars)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemModel &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other._imageurls, _imageurls) &&
            const DeepCollectionEquality()
                .equals(other.numberOfStars, numberOfStars));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_imageurls),
      const DeepCollectionEquality().hash(numberOfStars));

  @JsonKey(ignore: true)
  @override
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      __$$_ItemModelCopyWithImpl<_$_ItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemModelToJson(
      this,
    );
  }
}

abstract class _ItemModel implements ItemModel {
  const factory _ItemModel(
      {required final int total,
      required final String name,
      required final double price,
      required final String id,
      required final String description,
      required final List<String> imageurls,
      final double? numberOfStars}) = _$_ItemModel;

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$_ItemModel.fromJson;

  @override
  int get total;
  @override
  String get name;
  @override
  double get price;
  @override
  String get id;
  @override
  String get description;
  @override
  List<String> get imageurls;
  @override
  double? get numberOfStars;
  @override
  @JsonKey(ignore: true)
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
